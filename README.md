# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-04-15T04:40:57.115887+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.939 |  |
| ap-east-1 | 0.768 |  |
| ap-east-2 | 0.703 |  |
| ap-northeast-1 | 0.583 |  |
| ap-northeast-2 | 0.705 |  |
| ap-northeast-3 | 0.617 |  |
| ap-south-1 | 0.928 |  |
| ap-south-2 | 0.970 |  |
| ap-southeast-1 | 0.834 |  |
| ap-southeast-2 | 0.751 |  |
| ap-southeast-3 | 0.903 |  |
| ap-southeast-4 | 0.786 |  |
| ap-southeast-5 | 0.867 |  |
| ap-southeast-6 | 0.792 |  |
| ap-southeast-7 | 0.938 |  |
| ca-central-1 | 0.133 | 16 |
| ca-west-1 | 0.252 |  |
| eu-central-1 | 0.448 |  |
| eu-central-2 | 0.464 |  |
| eu-north-1 | 0.496 |  |
| eu-south-1 | 0.474 |  |
| eu-south-2 | 0.485 |  |
| eu-west-1 | 0.372 |  |
| eu-west-2 | 0.406 |  |
| eu-west-3 | 0.428 |  |
| il-central-1 | 0.615 |  |
| me-central-1 | 0.828 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.552 |  |
| us-east-1 | 0.098 | 4506 |
| us-east-2 | 0.097 | 1500 |
| us-gov-east-1 | 0.099 | 1648 |
| us-gov-west-1 | 0.265 | 193 |
| us-west-1 | 0.208 | 3413 |
| us-west-2 | 0.258 | 155 |

