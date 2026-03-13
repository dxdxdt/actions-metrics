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
Updated: 2026-03-13T05:43:18.280849+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.925 |  |
| ap-east-1 | 0.788 |  |
| ap-east-2 | 0.724 |  |
| ap-northeast-1 | 0.601 |  |
| ap-northeast-2 | 0.712 |  |
| ap-northeast-3 | 0.628 |  |
| ap-south-1 | 0.893 |  |
| ap-south-2 | 0.908 |  |
| ap-southeast-1 | 0.855 |  |
| ap-southeast-2 | 0.756 |  |
| ap-southeast-3 | 0.909 |  |
| ap-southeast-4 | 0.798 |  |
| ap-southeast-5 | 0.875 |  |
| ap-southeast-6 | 0.835 |  |
| ap-southeast-7 | 0.958 |  |
| ca-central-1 | 0.118 | 16 |
| ca-west-1 | 0.240 |  |
| eu-central-1 | 0.432 |  |
| eu-central-2 | 0.446 |  |
| eu-north-1 | 0.483 |  |
| eu-south-1 | 0.464 |  |
| eu-south-2 | 0.473 |  |
| eu-west-1 | 0.360 |  |
| eu-west-2 | 0.393 |  |
| eu-west-3 | 0.417 |  |
| il-central-1 | 0.603 |  |
| me-central-1 | 0.806 |  |
| me-south-1 | 0.760 |  |
| mx-central-1 | 0.248 |  |
| sa-east-1 | 0.532 |  |
| us-east-1 | 0.088 | 4273 |
| us-east-2 | 0.091 | 1422 |
| us-gov-east-1 | 0.092 | 1566 |
| us-gov-west-1 | 0.265 | 180 |
| us-west-1 | 0.243 | 3217 |
| us-west-2 | 0.262 | 145 |

