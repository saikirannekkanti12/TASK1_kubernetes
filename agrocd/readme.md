
# 🚀 Step 1: Create Namespace

```bash
kubectl create namespace argocd
```

---

# 🚀 Step 2: Install Argo CD (Fix CRD issue)

Use **server-side apply** (avoids annotation size error):

```bash
kubectl apply --server-side -n argocd \
  -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

👉 Wait until pods are ready:

```bash
kubectl get pods -n argocd
```

---

# 🚀 Step 3: Expose Argo CD via LoadBalancer

```bash
kubectl patch svc argocd-server -n argocd \
  -p '{"spec": {"type": "LoadBalancer"}}'
```

---

# 🚀 Step 4: Get External IP

```bash
kubectl get svc argocd-server -n argocd
```

👉 Wait until:

```text
EXTERNAL-IP: <your-ip>
```

---

# 🚀 Step 5: Access UI

Open in browser:

```text
https://<EXTERNAL-IP>
```

⚠️ You will see SSL warning → click **Advanced → Proceed**

---

# 🔐 Step 6: Get Username & Password

### Username:

```text
admin
```

### Password:

```bash
kubectl get secret argocd-initial-admin-secret -n argocd \
  -o jsonpath="{.data.password}" | base64 -d
```

---

# 🔍 Step 7: Verify Everything

```bash
kubectl get pods -n argocd
kubectl get svc -n argocd
```

---




