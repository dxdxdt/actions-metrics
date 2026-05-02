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
Updated: 2026-05-02T22:33:01.500993+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.984 |  |
| ap-east-1 | 0.710 |  |
| ap-east-2 | 0.639 |  |
| ap-northeast-1 | 0.542 |  |
| ap-northeast-2 | 0.637 |  |
| ap-northeast-3 | 0.559 |  |
| ap-south-1 | 0.876 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.787 |  |
| ap-southeast-2 | 0.688 |  |
| ap-southeast-3 | 0.842 |  |
| ap-southeast-4 | 0.739 |  |
| ap-southeast-5 | 0.810 |  |
| ap-southeast-6 | 0.756 |  |
| ap-southeast-7 | 0.890 |  |
| ca-central-1 | 0.182 | 16 |
| ca-west-1 | 0.228 |  |
| eu-central-1 | 0.510 |  |
| eu-central-2 | 0.510 |  |
| eu-north-1 | 0.543 |  |
| eu-south-1 | 0.517 |  |
| eu-south-2 | 0.526 |  |
| eu-west-1 | 0.409 |  |
| eu-west-2 | 0.449 |  |
| eu-west-3 | 0.474 |  |
| il-central-1 | 0.651 |  |
| me-central-1 | 0.864 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.606 |  |
| us-east-1 | 0.147 | 4586 |
| us-east-2 | 0.119 | 1558 |
| us-gov-east-1 | 0.119 | 1671 |
| us-gov-west-1 | 0.212 | 194 |
| us-west-1 | 0.148 | 3522 |
| us-west-2 | 0.207 | 157 |

