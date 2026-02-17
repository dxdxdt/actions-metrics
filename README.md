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
Updated: 2026-02-17T06:49:25.749513+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.949 |  |
| ap-east-1 | 0.760 |  |
| ap-east-2 | 0.686 |  |
| ap-northeast-1 | 0.577 |  |
| ap-northeast-2 | 0.681 |  |
| ap-south-1 | 0.906 |  |
| ap-south-2 | 0.970 |  |
| ap-southeast-1 | 0.821 |  |
| ap-southeast-2 | 0.738 |  |
| ap-southeast-3 | 0.881 |  |
| ap-southeast-4 | 0.780 |  |
| ap-southeast-5 | 0.843 |  |
| ap-southeast-6 | 0.793 |  |
| ap-southeast-7 | 0.927 |  |
| ca-central-1 | 0.104 | 16 |
| ca-west-1 | 0.208 |  |
| eu-central-1 | 0.453 |  |
| eu-central-2 | 0.472 |  |
| eu-north-1 | 0.504 |  |
| eu-south-1 | 0.474 |  |
| eu-south-2 | 0.494 |  |
| eu-west-1 | 0.381 |  |
| eu-west-2 | 0.409 |  |
| eu-west-3 | 0.440 |  |
| il-central-1 | 0.624 |  |
| me-central-1 | 0.835 |  |
| me-south-1 | 0.798 |  |
| mx-central-1 | 0.205 |  |
| sa-east-1 | 0.575 |  |
| us-east-1 | 0.094 | 4134 |
| us-east-2 | 0.074 | 1349 |
| us-gov-east-1 | 0.073 | 1484 |
| us-gov-west-1 | 0.226 | 150 |
| us-west-1 | 0.237 | 3066 |
| us-west-2 | 0.225 | 126 |

