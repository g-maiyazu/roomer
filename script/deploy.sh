cat <<EOF >> ~/.ssh/config
  User genki
  ForwardAgent yes
EOF

eval $(ssh-agent)
ssh-add

bundle exec cap production deploy