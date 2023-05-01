#include <iostream>
#include <string>
#include <vector>
#include <sstream>
#include <unordered_map>
#include <regex>
#include <stack>


using namespace std;

struct Node {
    string tag;
    unordered_map<string, string> att;
    vector<Node *> child;
};

string getTagFirstPart(string str) {
    string temp;
    stringstream ss(str);
    ss >> temp;
    return temp;
}

bool isOpenTag(string str) {
    size_t found = str.find("</");
    if (found == string::npos) {
        return true;
    }
    return false;
}

string getTagName(string str) {
    size_t found = str.find("</");
    size_t foundClose = str.find(">");
    if (found == string::npos) {
        if (foundClose != string::npos) {
            str = str.substr(0, str.size()-1);
        }
        return str.replace(0,1,"");
    } else {
        return str.replace(0,2,"");
    }
}
string trim(const string& str)
{
    size_t first = str.find_first_not_of(' ');
    if (string::npos == first)
    {
        return str;
    }
    size_t last = str.find_last_not_of(' ');
    return str.substr(first, (last - first + 1));
}

void handleAttributes(unordered_map<string, string> &att, string attString) {
    regex regexp("[A-Za-z0-9_!@#$%^&]+[\\s]*=[\\s]*\"[A-Za-z0-9\\._!@#$%^&]+\"");
    smatch m;
    sregex_iterator m1(attString.begin(), attString.end(), regexp);
    string temp;
    string str;
    string subStr;
    string value;

    for (; m1 != sregex_iterator(); m1++) {
        m = *m1;
        size_t found = m.str(0).find("=");
        string key = m.str(0).substr(0, found);
        key = trim(key);
        str = m.str(0);
        subStr = str.substr(found+1, str.size());
        subStr.erase(remove(subStr.begin(), subStr.end(), '\"'), subStr.end());
        value = trim(subStr);
        att[key] = value;
    }

}

Node* createNewTag(string name) {
    Node* node = new Node;
    node->tag = name;
    return node;
}

Node* parseTags(vector<string> vec) {
    Node* root = new Node;
    Node* node;
    Node* node2 = NULL;
    stack<Node *> stk;
    string tag;
    string tagName ;
    node = root;

    for (int i = 0; i < vec.size(); i++) {
        tag = getTagFirstPart(vec[i]);
        tagName = getTagName(tag);
        if (isOpenTag(tag)) {
            node2 = createNewTag(tagName);
            handleAttributes(node2->att, vec[i]);
            node->child.push_back(node2);
            stk.push(node);
            node = node2;
        } else {
            if (!stk.empty()) {
                node = stk.top();
                stk.pop();
            }
        }
    }

    return root;
}

string getAttValue(Node* node, string str) {
    string key = "";
    size_t found = str.find("~");
    if (found != string::npos) {
        key = str.substr(found+1, str.size()-1);
    }
    return node->att[key];
}

bool isAtrributeQueryValid(string str) {
    regex re("[A-Za-z1-9]+~(.*)");
    return regex_match(str, re);
}

string getTagNameFromAttForm(string str) {
    stringstream ss(str);
    string temp;
    getline(ss,temp,'~');
    return temp;
}

Node* getNodeForAttributedForm(Node* node, vector<string>* queryVec) {
    
    if (isAtrributeQueryValid(queryVec->back())) {
        string tagName = getTagNameFromAttForm(queryVec->back());
        Node* newNode = node;
        return newNode;
    }

    return NULL;
}

vector<string>* getQueryVector(vector<string>* vec, string query) {
    stringstream ss(query);
    string temp;
    while (getline(ss,temp,'.')){
        vec->push_back(temp);
    }

    return vec;
}

string getAttName(string str) {
    stringstream ss(str);
    string temp;
    while (getline(ss,temp,'~')){}
    return temp;
}

Node* getTagNameForAttQueryForm(Node* root,  string query) {
    string tageName = getTagNameFromAttForm(query);
    for (Node* n: root->child) {
        if (n->tag == tageName) {
            return n;
        }
    }

    return NULL;
    
}

Node* getTagNode(Node* root,  vector<string>* queryVec) {
 
    bool shouldBreakWithNull = false;
    for(int i = 0; i < queryVec->size(); i++){
        if (shouldBreakWithNull) {
            return NULL;
        }
        shouldBreakWithNull = true;
        for (Node* n: root->child) {
            if (n->tag == queryVec->at(i)) {
                root = n;
                shouldBreakWithNull = false;
                break;
            }
        }
    }

    string first = getTagNameFromAttForm(queryVec->back());
    for (Node* n: root->child) {
        if (first == n->tag) {
            return n;
        }
    }
    
    return NULL;
}




void handleQuery(Node* root,vector<string>* queryVec, string query) {
    queryVec->clear();
    queryVec = new vector<string>;
    queryVec = getQueryVector(queryVec, query);
    Node* node; 
    if (queryVec->size() == 1) {
        node = getTagNameForAttQueryForm(root, queryVec->front());
    } else {
        node = getTagNode(root, queryVec);
    }
    if (node == NULL) {
        cout << "Not Found!" << endl;
    } else {
        string attStr = getAttName(queryVec->back());
        if (node->att[attStr].empty() ) {
            cout <<"Not Found!" << endl;
        } else {
            cout << node->att[attStr] << endl;
        }
        
    }

}

void printTree(Node* root) {
    cout << root->tag;
    cout << "[children: " << root->child.size() << "]";
    for (auto& it: root->att) {
        cout << "| key: " << it.first << ", value: " << it.second << endl;
    }
    cout << endl;
    for(Node* n: root->child) {
        printTree(n);
    }
    
}

void mainFunc() {
    int n,q;
    cin >> n >> q;
    cin.ignore();
    unordered_map<string,string> map;
    vector<string> nStream;
    vector<string> query;
    vector<string> queryVec;
    string str;
    Node *root;

    for (int i = 0; i < n; i++) {
        str = "";
        getline(cin, str);
        nStream.push_back(str);
    }
    root = parseTags(nStream);
    // printTree(root);
    
   for (int i = 0; i < q; i++) {
        str = "";
        getline(cin, str);
        query.push_back(str);  
    }

    for (auto &item: query) {
        handleQuery(root, &queryVec, item);      
    }
    // cout << "============================" << endl;
    // printTree(root);
    // cout << "============================" << endl;
}



int main() {

// string s = "<c height = \"auto\">";
// regex re("[A-Za-z1-9]+[\\s]*=[\\s]*\"[A-Za-z0-9_$]+\"");
// smatch m;
// sregex_iterator it(s.begin(), s.end(), re);
// for (; it != sregex_iterator(); it++) {
//     cout << it->str(0) << endl;
// }

// regex re("[A-Za-z1-9]+~(.*)");
// cout << regex_match("a.a~value", re) << endl;
// cout << regex_match("a~value", re) << endl;



    mainFunc();


    

    return 0;
}

// to do next make parent node then start add tags as childreen to this node