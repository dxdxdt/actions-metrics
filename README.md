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
Updated: 2026-08-20T11:19:29.919492+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.011 |  |
| ap-east-1 | 0.673 |  |
| ap-east-2 | 0.611 |  |
| ap-northeast-1 | 0.493 |  |
| ap-northeast-2 | 0.594 |  |
| ap-northeast-3 | 0.518 |  |
| ap-south-1 | 0.941 |  |
| ap-south-2 | 0.960 |  |
| ap-southeast-1 | 0.746 |  |
| ap-southeast-2 | 0.649 |  |
| ap-southeast-3 | 0.804 |  |
| ap-southeast-4 | 0.694 |  |
| ap-southeast-5 | 0.765 |  |
| ap-southeast-6 | 0.677 |  |
| ap-southeast-7 | 0.851 |  |
| ca-central-1 | 0.245 | 18 |
| ca-west-1 | 0.239 |  |
| eu-central-1 | 0.530 |  |
| eu-central-2 | 0.552 |  |
| eu-north-1 | 0.574 |  |
| eu-south-1 | 0.555 |  |
| eu-south-2 | 0.566 |  |
| eu-west-1 | 0.452 |  |
| eu-west-2 | 0.483 |  |
| eu-west-3 | 0.504 |  |
| il-central-1 | 0.677 |  |
| me-central-1 | 0.925 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.643 |  |
| us-east-1 | 0.188 | 5027 |
| us-east-2 | 0.206 | 1680 |
| us-gov-east-1 | 0.175 | 1860 |
| us-gov-west-1 | 0.175 | 224 |
| us-west-1 | 0.114 | 4002 |
| us-west-2 | 0.175 | 184 |

