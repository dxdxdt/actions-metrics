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
Updated: 2026-03-07T16:19:36.466983+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.016 |  |
| ap-east-1 | 0.679 |  |
| ap-east-2 | 0.624 |  |
| ap-northeast-1 | 0.502 |  |
| ap-northeast-2 | 0.607 |  |
| ap-northeast-3 | 0.526 |  |
| ap-south-1 | 0.933 |  |
| ap-south-2 | 0.941 |  |
| ap-southeast-1 | 0.752 |  |
| ap-southeast-2 | 0.655 |  |
| ap-southeast-3 | 0.808 |  |
| ap-southeast-4 | 0.698 |  |
| ap-southeast-5 | 0.772 |  |
| ap-southeast-6 | 0.694 |  |
| ap-southeast-7 | 0.855 |  |
| ca-central-1 | 0.214 | 16 |
| ca-west-1 | 0.216 |  |
| eu-central-1 | 0.519 |  |
| eu-central-2 | 0.555 |  |
| eu-north-1 | 0.577 |  |
| eu-south-1 | 0.558 |  |
| eu-south-2 | 0.556 |  |
| eu-west-1 | 0.429 |  |
| eu-west-2 | 0.484 |  |
| eu-west-3 | 0.495 |  |
| il-central-1 | 0.682 |  |
| me-central-1 | 0.893 |  |
| me-south-1 | 0.849 |  |
| mx-central-1 | 0.222 |  |
| sa-east-1 | 0.628 |  |
| us-east-1 | 0.195 | 4235 |
| us-east-2 | 0.157 | 1407 |
| us-gov-east-1 | 0.156 | 1538 |
| us-gov-west-1 | 0.156 | 174 |
| us-west-1 | 0.150 | 3191 |
| us-west-2 | 0.156 | 143 |

