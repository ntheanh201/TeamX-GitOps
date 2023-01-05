## Blue/Green Deployment

Change the container image of the rollout to the next version with:
kubectl argo rollouts set image simple-rollout webserver-simple=docker.io/kostiscodefresh/gitops-canary-app:v2.0


After you change the image the following things happen

Argo Rollouts creates another replicaset with the new version
The old version is still there and gets live/active traffic
ArgoCD will mark the application as out-of-sync
ArgoCD will also mark the health of the application as "suspended" because we have setup the new color to wait

Notice that even though the next version of our application is already deployed, all live traffic goes to the old version. You can verify this by looking at the "live traffic" tab.

At this point the deployment is suspended because we have used the autoPromotionEnabled: false property in the definition of the rollout.

To manually promote the deployment and switch all traffic to the new version enter:
kubectl argo rollouts promote simple-rollout