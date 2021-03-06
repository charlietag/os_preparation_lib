echo "-----------"
echo "copy config files"
echo "copy all files under ${HELPER_VIEW_FOLDER}"
echo "including folders"
echo "-----------"
local current_confs=($(find ${HELPER_VIEW_FOLDER} -type f))
local current_target=""
local current_target_folder=""
for current_conf in ${current_confs[@]}
do
  current_target="${current_conf/${HELPER_VIEW_FOLDER}/}"
  current_target_folder="$(dirname $current_target)"

  test -d $current_target_folder || mkdir -p $current_target_folder

  echo "Setting up config file \"${current_target}\"......"
  \cp -a --backup=t $current_conf $current_target
done

