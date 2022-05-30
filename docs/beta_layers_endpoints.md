---
title: Endpoints
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';
import useBaseUrl from '@docusaurus/useBaseUrl';

<!-- the following links are referenced throughout this document -->
[1]: https://github.com/Leaf-Agriculture/Leaf-quickstart-Postman-collection
## About
All HTTP methods should be prepended by this service's endpoint:

```
https://api.withleaf.io/services/beta/api
```

See below the REST resources and their endpoints available in this service.

## Layers (BETA)

### Get all the layers for a Leaf User

&nbsp<span class="badge badge--success">GET</span> `/users/{leafUserId}/layers`

Gets a paged list of layers that belong for a Leaf User. This endpoint point can be filtered by the following layer types. Note that these types are related to Sentera integration, please check the details [here](https://blog.withleaf.io/en/senteraintegrationwithleaf).

| Parameter (to filter by) | Values
| - | - |
| `type` | `TASSEL_COUNT`, `STAND_COUNT`, `NVDI`, and `RGB`|

You can also pass some parameters used exclusively for paging through results.
They are:

- `page`, an integer specifying the page being fetched (default is 0)
- `size`, an integer specifying the size of the page (max is 100)

:::info the default value for page size is 20
If the parameters page and size are not set, the endpoint will return 20 results.
:::

<Tabs
defaultValue="sh"
values={[
{ label: 'cURL', value: 'sh', },
{ label: 'Python', value: 'py', },
{ label: 'JavaScript', value: 'js', },
]
}>
<TabItem value="js">

  ```js
  const axios = require('axios')
  const TOKEN = 'YOUR_TOKEN'
  const endpoint = 'https://api.withleaf.io/services/beta/api/users/{leafUserId}/layers'
  const headers = { 'Authorization': `Bearer ${TOKEN}` }

  axios.get(endpoint, { headers })
      .then(res => console.log(res.data))
      .catch(console.error)
  ```

  </TabItem>
  <TabItem value="py">

  ```py
  import requests
  
  TOKEN = 'YOUR_TOKEN'
  endpoint = 'https://api.withleaf.io/services/beta/api/users/{leafUserId}/layers'
  headers = {'Authorization': f'Bearer {TOKEN}'}

  response = requests.get(endpoint, headers=headers, json=data)
  print(response.json())
  ```

  </TabItem>
  <TabItem value="sh">

  ```shell
  curl -X GET \
      -H 'Authorization: Bearer YOUR_TOKEN' \
      'https://api.withleaf.io/services/beta/api/users/{leafUserId}/layers'
  ```

  </TabItem>
</Tabs>


#### Response
A json array of layers available.

```json
[
  {
    "id": "96a098e0-f1d0-47e8-968d-9d55d54da114",
    "leafUserId": "055c4d61-b1e2-4fa9-873c-23433a11c271",
    "apiOwnerUsername": "fabyan",
    "type": "RGB",
    "origin": "PROVIDER_POOLED",
    "provider": "Sentera",
    "providerLayerId": "vnoyi6a_FI_edovSouthernM_CV_prod_82f9b3d6_211018_151052",
    "providerFieldId": "ycof8zg_AS_edovSouthernM_CV_prod_a025df2d_211015_200456",
    "name": "QuickTile RGB",
    "size": 159135298,
    "md5": "7ff746c6f5f06fc25b46420328402bed",
    "contentS3": "https://layers-leaf-dev.s3.us-east-1.amazonaws.com/96a098e0-f1d0-47e8-968d-9d55d54da114.tif",
    "createdAt": "2022-02-16T21:40:20.257Z",
    "leafFieldIds": [
      "f43ca7cc-c73a-43b9-8685-070b03876475",
      "edcf7b8b-913e-4e53-a0b5-91aa16699dfc"
    ]
  },
  {
    "id": "4d9b0139-f528-43ab-8bc9-a31043fa87d2",
    "leafUserId": "055c4d61-b1e2-4fa9-873c-23433a11c271",
    "apiOwnerUsername": "fabyan",
    "type": "RGB",
    "origin": "PROVIDER_POOLED",
    "provider": "Sentera",
    "providerLayerId": "<UUID defined by the provider>",
    "providerFieldId": "<UUID defined by the provider>",
    "name": "QuickTile RGB",
    "size": 121910506,
    "md5": "759d1f68962e30ea78f40025c8b64972",
    "contentS3": "https://layers-leaf-dev.s3.us-east-1.amazonaws.com/4d9b0139-f528-43ab-8bc9-a31043fa87d2.tif",
    "createdAt": "2022-02-16T21:40:35.341Z",
    "leafFieldIds": [
      "f43ca7cc-c73a-43b9-8685-070b03876475",
      "edcf7b8b-913e-4e53-a0b5-91aa16699dfc"
    ]
  }
]
```

[contact]: mailto:help@withleaf.io