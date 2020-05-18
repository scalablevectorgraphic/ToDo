##!! To-Do Software by Scalablevectorgraphic !!##
#!/bin/bash
if [ "$1" == "list" ]
then

printf "To-Do List:\n"
printf "Priority:\n"
awk '{print NR-0 $0}' ~/to-do.a.txt
printf "\nNormal:\n"
awk '{print NR-0 $0}' ~/to-do.txt

elif [ "$1" == "list-if" ]
then
if [ "$(test -e ~/to-do.txt|| echo "no")" != "no" ]
then
todo list
fi

else
printf "To-Do List\n"
touch ~/to-do.a.txt
touch ~/to-do.txt
printf "Priority:\n"
awk '{print NR-0 $0}' ~/to-do.a.txt
printf "Normal:\n"
awk '{print NR-0 $0}' ~/to-do.txt

printf "Add(a) or remove(r):"
read var_AddRemove

if [ "$var_AddRemove" == "" ]
then
printf "Exiting\n\n\n"


elif [ "$var_AddRemove" == "a" ]
then
printf "Adding to to-do list\n"
printf "Enter to-do item:\n"
read var_item
printf "Priority(y or n)?"
read var_priority

if [ "$var_priority" == "y" ]
then
echo "- $var_item" >> ~/to-do.a.txt
else
echo "- $var_item" >> ~/to-do.txt
fi


elif [ "$var_AddRemove" == "r" ]
then
printf "Removing from to-do list\n"
printf "Priority or Normal(p/n):"
read var_priority
printf "Enter list number:"
read var_num
if [ "$var_priority" == "p" ]
then
sed -i ''$var_num' d' ~/to-do.a.txt
else
sed -i ''$var_num' d' ~/to-do.txt
fi

elif [ "$var_AddRemove" == "c" ]
then
rm ~/to-do.txt
rm ~/to-do.a.txt

fi
fi
