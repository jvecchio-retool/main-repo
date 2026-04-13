<GlobalFunctions>
  <SqlQueryUnified
    id="queryFishView"
    query={include("./lib/queryFishView.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="3b39cc6e-d82d-48d8-818f-5433148daed9"
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="queryNewOrders"
    enableTransformer={true}
    query={include("./lib/queryNewOrders.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="3b39cc6e-d82d-48d8-818f-5433148daed9"
    warningCodes={[]}
  />
</GlobalFunctions>
