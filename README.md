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
Updated: 2026-02-26T16:49:41.758444+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.008 |  |
| ap-east-1 | 0.698 |  |
| ap-east-2 | 0.639 |  |
| ap-northeast-1 | 0.520 |  |
| ap-northeast-2 | 0.635 |  |
| ap-northeast-3 | 0.547 |  |
| ap-south-1 | 0.889 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.774 |  |
| ap-southeast-2 | 0.671 |  |
| ap-southeast-3 | 0.829 |  |
| ap-southeast-4 | 0.709 |  |
| ap-southeast-5 | 0.798 |  |
| ap-southeast-6 | 0.718 |  |
| ap-southeast-7 | 0.877 |  |
| ca-central-1 | 0.229 | 16 |
| ca-west-1 | 0.210 |  |
| eu-central-1 | 0.523 |  |
| eu-central-2 | 0.546 |  |
| eu-north-1 | 0.544 |  |
| eu-south-1 | 0.541 |  |
| eu-south-2 | 0.546 |  |
| eu-west-1 | 0.423 |  |
| eu-west-2 | 0.477 |  |
| eu-west-3 | 0.488 |  |
| il-central-1 | 0.697 |  |
| me-central-1 | 0.897 |  |
| me-south-1 | 0.855 |  |
| mx-central-1 | 0.255 |  |
| sa-east-1 | 0.617 |  |
| us-east-1 | 0.169 | 4188 |
| us-east-2 | 0.163 | 1381 |
| us-gov-east-1 | 0.167 | 1512 |
| us-gov-west-1 | 0.186 | 162 |
| us-west-1 | 0.141 | 3124 |
| us-west-2 | 0.190 | 132 |

