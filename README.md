# mig-dev
Collection of files and notes to assist with mig development and testing

# SA setup 

```bash
# Create a new service account in the mig ns
oc create sa -n mig mig
# Grant it cluster-admin (cluster level root privileges, use with caution!)
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:mig:mig
# Dump the ServiceAccount's token which can be used as a Bearer token
oc sa get-token -n mig mig
```
