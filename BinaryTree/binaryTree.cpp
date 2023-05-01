
#include <iostream>
#include <unordered_map>
#include <map>
#include <queue>

using namespace std;

class Node {
    public:
        int data;
        Node *left;
        Node *right;
        Node(int d) {
            data = d;
            left = NULL;
            right = NULL;
        }
};

class Solution {
    public:
  		Node* insert(Node* root, int data) {
            if(root == NULL) {
                return new Node(data);
            } else {
                Node* cur;
                if(data <= root->data) {
                    cur = insert(root->left, data);
                    root->left = cur;
                } else {
                    cur = insert(root->right, data);
                    root->right = cur;
               }

               return root;
           }
        }



    void printBFS(queue<Node*> q) {
        if (q.empty()) {
           return;
        }

        Node* node = q.front();
        q.pop();
        cout << node->data << " ";
        if (node->left) {
            q.push(node->left);
        }

        if (node->right) {
            q.push(node->right);
        }

        printBFS(q);
    }

    void levelOrder(Node * root) {
        queue<Node*> q;
        q.push(root);
        printBFS(q);
    }


    void topView(Node * root) {
        map<int,map<int,int>> m;
        topViewRec(root,0, 0,&m);
        for(auto &item: m) {
            cout << item.second.begin()->second <<  " ";
        }
    }

    

    private:
        void topViewRec(Node * root,int hLevel, int vLevel, map<int,map<int,int>>* m) {
            if (!root) {
                return ;
            }

            if (m->find(vLevel) == m->end() ) {
                map<int,int> m2;
                m2.insert({hLevel,root->data});
                m->insert({vLevel,m2});
            }  else if (m->at(vLevel).begin()->first > hLevel) {
                m->erase(vLevel);
                map<int,int> m2;
                m2.insert({hLevel,root->data});
                m->insert({vLevel,m2});
            }
            topViewRec(root->left,hLevel+1, vLevel-1, m);
            topViewRec(root->right,hLevel+1, vLevel+1, m);
        }



}; 

int main() {
  
    Solution myTree;
    Node* root = NULL;
    
    int t;
    int data;

    std::cin >> t;

    while(t-- > 0) {
        std::cin >> data;
        root = myTree.insert(root, data);
    }
  
	myTree.levelOrder(root);

  

    return 0;
}