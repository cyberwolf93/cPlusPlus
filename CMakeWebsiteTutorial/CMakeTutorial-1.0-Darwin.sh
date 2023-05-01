#!/bin/sh

# Display usage
cpack_usage()
{
  cat <<EOF
Usage: $0 [options]
Options: [defaults in brackets after descriptions]
  --help            print this message
  --version         print cmake installer version
  --prefix=dir      directory in which to install
  --include-subdir  include the CMakeTutorial-1.0-Darwin subdirectory
  --exclude-subdir  exclude the CMakeTutorial-1.0-Darwin subdirectory
  --skip-license    accept license
EOF
  exit 1
}

cpack_echo_exit()
{
  echo $1
  exit 1
}

# Display version
cpack_version()
{
  echo "CMakeTutorial Installer Version: 1.0, Copyright (c) Humanity"
}

# Helper function to fix windows paths.
cpack_fix_slashes ()
{
  echo "$1" | sed 's/\\/\//g'
}

interactive=TRUE
cpack_skip_license=FALSE
cpack_include_subdir=""
for a in "$@"; do
  if echo $a | grep "^--prefix=" > /dev/null 2> /dev/null; then
    cpack_prefix_dir=`echo $a | sed "s/^--prefix=//"`
    cpack_prefix_dir=`cpack_fix_slashes "${cpack_prefix_dir}"`
  fi
  if echo $a | grep "^--help" > /dev/null 2> /dev/null; then
    cpack_usage
  fi
  if echo $a | grep "^--version" > /dev/null 2> /dev/null; then
    cpack_version
    exit 2
  fi
  if echo $a | grep "^--include-subdir" > /dev/null 2> /dev/null; then
    cpack_include_subdir=TRUE
  fi
  if echo $a | grep "^--exclude-subdir" > /dev/null 2> /dev/null; then
    cpack_include_subdir=FALSE
  fi
  if echo $a | grep "^--skip-license" > /dev/null 2> /dev/null; then
    cpack_skip_license=TRUE
  fi
done

if [ "x${cpack_include_subdir}x" != "xx" -o "x${cpack_skip_license}x" = "xTRUEx" ]
then
  interactive=FALSE
fi

cpack_version
echo "This is a self-extracting archive."
toplevel="`pwd`"
if [ "x${cpack_prefix_dir}x" != "xx" ]
then
  toplevel="${cpack_prefix_dir}"
fi

echo "The archive will be extracted to: ${toplevel}"

if [ "x${interactive}x" = "xTRUEx" ]
then
  echo ""
  echo "If you want to stop extracting, please press <ctrl-C>."

  if [ "x${cpack_skip_license}x" != "xTRUEx" ]
  then
    more << '____cpack__here_doc____'
This is the open source License.txt file introduced in
CMake/Tutorial/Step9...

____cpack__here_doc____
    echo
    while true
      do
        echo "Do you accept the license? [yn]: "
        read line leftover
        case ${line} in
          y* | Y*)
            cpack_license_accepted=TRUE
            break;;
          n* | N* | q* | Q* | e* | E*)
            echo "License not accepted. Exiting ..."
            exit 1;;
        esac
      done
  fi

  if [ "x${cpack_include_subdir}x" = "xx" ]
  then
    echo "By default the CMakeTutorial will be installed in:"
    echo "  \"${toplevel}/CMakeTutorial-1.0-Darwin\""
    echo "Do you want to include the subdirectory CMakeTutorial-1.0-Darwin?"
    echo "Saying no will install in: \"${toplevel}\" [Yn]: "
    read line leftover
    cpack_include_subdir=TRUE
    case ${line} in
      n* | N*)
        cpack_include_subdir=FALSE
    esac
  fi
fi

if [ "x${cpack_include_subdir}x" = "xTRUEx" ]
then
  toplevel="${toplevel}/CMakeTutorial-1.0-Darwin"
  mkdir -p "${toplevel}"
fi
echo
echo "Using target directory: ${toplevel}"
echo "Extracting, please wait..."
echo ""

# take the archive portion of this file and pipe it to tar
# the NUMERIC parameter in this command should be one more
# than the number of lines in this header file
# there are tails which don't understand the "-n" argument, e.g. on SunOS
# OTOH there are tails which complain when not using the "-n" argument (e.g. GNU)
# so at first try to tail some file to see if tail fails if used with "-n"
# if so, don't use "-n"
use_new_tail_syntax="-n"
tail $use_new_tail_syntax +1 "$0" > /dev/null 2> /dev/null || use_new_tail_syntax=""

extractor="pax -r"
command -v pax > /dev/null 2> /dev/null || extractor="tar xf -"

tail $use_new_tail_syntax +152 "$0" | gunzip | (cd "${toplevel}" && ${extractor}) || cpack_echo_exit "Problem unpacking the CMakeTutorial-1.0-Darwin"

echo "Unpacking finished successfully"

exit 0
#-----------------------------------------------------------
#      Start of TAR.GZ file
#-----------------------------------------------------------;
� P�Gd �}t�Օ����I���壐
J$��|�4vbb�N3�e[��$�C�R�'Ԋ�t�n ��;e�əav��)���#�,	g����1���C{>w`?-n��{�{�����I� ��{�}��w�������.�o+��`����$��9�U�r� �kk���uu�6�f������RF!
��`�k���9TX�z{���v���	t���hq=�n���A��{	�(:��z[�=5����j��{5�l�����W��'�L�6³
��e�����	���n�K�O޷7W��<�z�TO���=OyGV�K�)�lE	��i�l}c���5k�tI��2�I*J(�
�w���ϳh*P_�N������<����˿�A����ݭ��݁�vue��y�7�A��e��t��A���@{�B}wfЙ����}�p��g���ȠME��z|=����ϣ���ˠ�����q�g����ʎ�{ڸ6G��ea>T�����3ܮ���$�'���?�g٥��d0����o��fE�С�.�W	���MgЙv�y%����
��ۙ�����9=\|<��G�=�坻��Ld�3��94�@���K`��h��;����Y}������:j�YBn�"$Y�V�َ�2x�se�v8_%�)O�J��o9<[#��V��kk�!o�ףo��-�~\y�����?��ͻ&��kc�6�`i֗�Zӗ	�;�������D�^��|��5�Tk�x�o�q�}��b��dS�|ۡP�=��,�`#�3x���H�� @�  @�  @�  @�  �t8��p��8+L��М3I:c���!���q籺�.'DU�P��3Vgg�Ș* :>IX�^����������D#ϩ�\F%#c����дu*�ǆ���qU1�9�6}Y�G߼J���6Q!�8˲�4_�~p9��=A�:M�G�8P��3��꣗i&���A�eO8G��vF_�B�-�����Y8tN�_MH��5�Y�ı$g�gd��kA�Z2�TgW�Q�џ�k���3ҁ�ZyK����|G�������f2�X�3�P������w?\ƪH�'��wyus�wX
������J��+�M �n�V�#o�	m^$�͊�A�L��P�6
��0L��,���I�������	�Ȅ�[pT>�o���\Lg�c���q�#s���*�)LХQyl�����ϑ��״��s@��u��q���}�0��19� �%#'���@�����sj=�7zdp~~�7.�Ҡ5MH��=��=Lxwg	�W�3a����z�{�TT���ڬ�y�X��)UZ��P��u��V�>r�ʁ����
�0;Ӫ�i�(�*h�0�W�e���\��>���/�|�ţ�z���D���3�e�(��u���g�9*O�ʯ:G���|dEz�f_d."O����jj�?�ܝ ބ�IN��XÊ�$X����pV��M��O�2���u��I6c������q�ᵼp�d�c5h=624�Ę�	�dǫ��ǝ����	�&�Ҽ,����^�2T8�n�-�q m�'̇���~V�k��~�ʏӊտZ	��)����tƌI�Wjc=�I�:�ؙ�]2ú�C�.�2Ӊ�	X�?1��:�d���`��U��(���J
�?�o1G����|}TCP1]��dl�ڣ~mE�|��=)Q֏��ї��y��h�)�dm�*ʹ�9�H�O&�I�cO4�!m^,�ZW��u ߪV�m��������R�'�cއ0��.�o��K���VbT~W+ ���z?�6���a���׊?1m�9ׁ��-`�c��Y��r�M;���<�1�n�C4�2�U��m�ƿ`�U�K�;���o�5'�6���m�(g
2T�jm	��jy��xq��y�#��B���ϴ���ӗ]���[y{R��_��-.�:�B�Q0�Z��	��������sd�����?�F�|S�p�\�z�a#g�����f�˂������s~���7h}��`�������x~>�V�~P�9��D�>�F�b��M�\��e6��,v�&��Q�#<g�upZ=P���vހ���m��|��=�Վ���
zp;��=G�<��`�\��Qyz�g��۠���������i����@�����[Skn����TK�����x�t�Kn�����m�tK�o.��6M�w�kKM@�z�H����5o�(�2@�ܹYZ7�Z$��r�Zq�2��}Iu��
����d7�2��r�����ʴ�����Uצy��f�G�8�o˴+��R5_ĚUfM�q��?
�/:��ۯ��p�>]��_?WZp�~�Sٯ��ub.�?_V"�g�?���?�p���"��;����/�oCp��6)�߾�x�����7ܹ���N��
{7���ne�}�������~��������ޝ����=������}?{{������w��b�A������cW�����?�{w��r:�~	'��̾AS�pg_���NS�h����'i��:EStm���z���h��u�{4u/M=NSO�ԣ4�*M����)����z���HS�4�"M�IS�@S��m�l5M�K�6�Կ��i����5�,8o���e�5�d O��p�nظ~�+F��3��h��]�<f*����L���d*}�dxٴ>��<A�*�4X����5#y��g͟Xa(�X*)��d!��+䎦��N�����H�!�7�<!���"a��O
=K�^�Ha���	�|��Or�z$�`�d���������I�o��r)y�:�{M깐$?��3)M���j�}�����n"�q��5�<��)���8�����>t9��f�m�7TjH�VB�p@�,'� �f*����X�-ݫ�a
�w�e��L� "}����_�  @�  @�  @�  @�  @�  @�  @� ��p������[j9�!����7���8�?��?!�@��?E<����ĿB�!���tڻ�F�6�7�&� @�  @�  @�  @�  @�  @�  @�  @���?X�����#��W9�=m�E��v�#a��$�ܺ��{W�\���p�)}��J��}.�'|Hy�F�=��=J(�R�<�7�!����~WP	]�p�����/�P���C�����q�{�H1�z����[ww��k%	+T��v���������Ӧd��G�k�\!O����n���v�ݦ�r[�Һ��V ���Jjݾ���#��LM�Ю����Nu�+�͡1C��o�����0�>w(2���U��������]^��Hȭ����aZ�Ma��p��R�jw}�;�P��-Ӂ���4������������A֪z����6@U6.�ʁn�бx�;���N����;h5�x2������z#�~^��/^r���C;���*�h%Z�_�oH�EU�C�t+U(�����E.j<�V�j�:�8���u̔�� r�!���	+.�_�~_��t����������뺽nWP�����"m�m�&x|���g�J��K�r�y|
X��O9i��֬�'0�݃�>G�^MO�4�,��-���h"cb�8z0�!eh$�o*��b�Y�%\}�d.�m���~E�%�$��ɆK��N�Ҟ6^��z�h*�����+�=x��~wwG�n������/�F��F��O���#�����cw�R�-i�����l��j�X$�bi�I6�"YZ%����0H-(I��������8;O#@�H�c\�����a�L!���8?���������sځ�-H�#=��ҧʹ~b�8@ȷ =���M��Dz �8��#�@�5��H�[���9��H����C�[H� ]^����D�R�q���!}
iү#݊�M�9=��ב�B�5��H߸���i�+V�~�oC:�t'��H�Bz
�Y��H��Q?�{jB:�t�$��AZ��xOH�"��_g��߆���5V����z�%����٠����?�7��i�A�O�Q�O�F�?u6��)ި���F�?Y���)�M�O����ߦ���mz�ڦ���mzJj���8n��S�f�?�o��S�f�?�ܬ����z�4��Ij��S�I�O�&�?�7���v�ޟ:o��S��R����ϫ����H_���HoE�Y��@��H���!�3��4���0���m�������é�hې��݇�'mi-��?!-!���i-����������4`��9}����m�IN4��Y��Y�F��~0�~>�~'��h���,��Y��g�U%z��,��,z$�~*�~-���,z>�^]���ˢ������,zG�;�> ������=�|�Nx\�t��O�;xz��Yd?<���g ���' σ���	���Ͻ���	��Ч\?��y5un���������_�;�����.�(�'K�'����y�/~�_�[��ߗ��~�w����/򞾘�E��/�V������}���~�7�bW���y�Ky�m<�ǣ�r�n��u<��ҋ��;����%/z�����S���p���8��a=���rJs�a]�^�}�,���z�>�5�t�L�ٙu�U��Z:���m�Pe��f��/��D�6^D
TS���z�e.���^�������u6����̋�n������*)o������p�V�r'np��/��]g���݋QS��
�
�q��%0�:k�j�����P����	��u�N��* ��)t~�2�����uE�a�E*aW�ܶ�uo���ʧaI��Z����t{
d��d������^w���t�e����_uN���=��6{lrs��l!k��}�;(���b]a(�����>h��!�˫xzwQ�y�3�\���WO�w�n�imW�3Ǣ���iR	����f�w�rC�g���B�pj շ�Vڷq��~�P�/�L���Ca}]�~bԱ���ۭ)�]@��R�~8��u+�6�A���`�_�F^}����f]����hz���\X#l4n��6ќ���QIo�p7t=7��Vg}J0�Δ����{[�Lx׎p��v�B��u�rr�rrsrjr�j�s��s���vb��GO/_�7���z)��luu��۪k9F�쵵���꺺j�d���kj�W�"0G�`�k���9TX�z{���v���	h㿣����=�;��^Oߖ�%��������W�ƿ����m�{M5�lKTQ���[�p�[�f#	�{$ ���B\�%�B°M�$8�K�wT^�U��-�|F���]{�(-ۿ�w�d_Hj�����:�d��ޖ�����ϺO��@��-�p��_7�%�����\�m5v{M=��z[�]��Oz�8UI����H���Y�%����뒞�(\������A��>��]��=][\�����MMu]�����Ԉ��Ӏkoq��o��ξz>����Z{c��A��lv��l;K��V��������ޖ��R��}��N�׉�ǌ�,G܀x?�o"~q�����x������WY����{)
������&�_�űކ~��eKw �ů����{�rB&��S�I�+��gs�W=�0x��z��2�S���t9Ei�����[�<���⸊�v��L9E�2�6�׷�T =��SF���z���;㓵l}��"�����S�!�)h��o��f}�l���k�v%��4���'P�p)ǣf���	�ͣRQ��Jo�5��o�c5Ǎ�W��������T*��#��20ư"U)�?��z62���'�Xv3>���s9�p�pF�y[z߼JN����5o�(5(�;7{���9��Z�f�����d��������,�=�.�Y<5�wE�cg6�>Ye��Ԝs�t�t����:��ѡ9g4�t�@$*� N��Ѐ�dFTg�'�fz�Xޒ.?47ߑ���i�5D�纙�3V�9T���d�f)��<��n�f�m'����q�N�2�fF�ǆ�Y�YޓH��/����'�#�Og�bVdB��6���4Ɗ��|L�0xdN2Y��1AE�ي��1�c��kM�����h�3LsL��4�u@��ɣ�3Pbb�y�����y޸K��4!����=�ݗ�ťZ�ҳ�2u/E��і����ٵY��=S����ٔ��1z�����?;��L��0C_A�k�ݢ�fz�S���D�?�o%���'��S:���s�aF�:q��3���F�W�#CIb>�"=�s�/2��� �p�uu�Vyx�&9a~b+֒`9Lr���Yy{g&�e*'�'���ٜ�u�s�M���Z^8I2������?b�Ȅy��U������j��e��h��k^�
'���8��6����yj?+���_��'��8���	x��=όɣG�Õ���G�u�L�.�9�.�2Ӊ��˙SyN� �g��*��$���'3�,����b�
=7�_�zǗ��԰�x\�4��z56{R�X�/QY��+��8�(6LS��ڤ[���F��Ʉ6	r�F>�͋E>,�:�oUS�:g~��_�/���?�b������|�Ȕ��J���j�����\r�'5�q�(6>�^s�g;Z�6H�d5�����v��y�cF[��������k^Zޡ�g~��9�1��7�LA���F��q�?�őN��d�����<�_�������ݚԻ�jtm=RgWd��A�w���1?&��#s������5�˃#[�@>L֑��L���ڏ
׿�|������
=�o0�
�K���9��o��?ѡ������q�<�o}��Me>˟�I�vT��Y`��9�_��<�Z�͓���<tV;Bp�>*��랃��o>3Q��� =�jo�I8w�H�/���mTn�|o��1��\OJU�%��`���v����^1n����F���6��&3�V����u��e��̿��7�"O��ic�kF��Κ?��P��T6Rr��&B6�W�M�쀛Z�~O(�����K]n������������zx�#CV6I �� _˹� _����'����ὲ/���F���1�6������[�+P>��U������}ȿ��}ȿ� ���	ޓo*��-��D~��Ǒ�� ?����� ��|����!e�8�+ه�B�3� �}8PD�eYq�$��-� K��)�O S~���g�����xy��[���Qj�yq��-�?��B�?��B�}��F��G�P�}�@����R!��_ȿ�ȿ� b���à�`Y^^7p���{g��Z��+-�w��>ߤr����r����!����E䞄ǉr����5<�I.����[��G��E�C��s���Ղ� ʭ*"��}}E����N�ܕE��q������@�ʭ."�1�%P�"r�����5���y�_�Qnc�r3(����������XD�m���ܾ"rk`�v���"r����*����ܺ���Mi��ɝ2��[��7@.����()I���"r7�/��-E��K��]SD��6�{6C_�~�i��b������wUi�����Yz~��-M�o�y�di���փ�.M�����[ ׏r_*"���ỵZ Q��rW!6|����,�'��X���&�5�r=x�&{Qq�>*O����~�S�VX�޲l�q6�������)x(?�ɯ�/_���I�'��w@� ���[�U��0�[+��T�3����[� �/���OU��8փ�l���+ٙ�j�d_IZ��2v���/�r�A|`�Yw/c}o�[��4��*����w�;M�h�^���
�}�����H�+�]��Q9�����rvF�|���YȺ���I�� � �Z;�X_ l|w;lX�� xCAd}|���R�OO ^A�/eg\�:�pc������,a���q	;KY������� �;��x?�&�����2�XV�����-#������Fv��>fd��Z{��7����o�w��������x�+��F��}��0\��N\��k�+��ag5�q7�>E����� �
�Q���|3�!��a~���a>='��Vz��I��0���uZ��ǩ(s ����v�Y ��h̟�q3���#,��%�\'�;K�	��C<�xq'bb	1A<c���#�D�@,!&�gX��aĝ��%��l����o h{g�C<��8��Qn�;;K�	�ʘ|���G;���i��9���>������k��=F,��SZy���KHGh�S��G���9��O���k񺐮/�x>H_���{|+��>�8��k��=Z�1l�s�_��� ۧ�k���/!�A�υ��I��_����Hk���������h��Hk��i����O�7i�L�)k���}�=��k�b�f?�;p��{k��v�݈|�����	�sZ�������vߔ�y�!�-��{�څ��
Nk���~���;B�`)�k��}y�?B��'���2^~
��R�����U���Mzڕ%��TO�BO?c���*���.��7e���Uzz_�}���/��.�ӆ,��Y���E?�ROߟU�Y��,~�����o��[�'ĥ�����_b/����hԉ��sI��|���Yh��.:8H��N��ā8.Ex��DK�Kh11�X����)��wq�Z��G��������\���#�T0NN,�|�7��PZ�u賜�4�ų�{_�O�/4T[�(	�װ4?��,��`�x/K��<"y\hp��O��O0��{�,���%��%u��W
�Y<L�"��-i�����%7�K�`.�û��(@� ��?�</
 0 