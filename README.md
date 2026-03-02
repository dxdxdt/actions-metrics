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
Updated: 2026-03-02T08:35:49.008270+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.901 |  |
| ap-east-1 | 0.780 |  |
| ap-east-2 | 0.716 |  |
| ap-northeast-1 | 0.597 |  |
| ap-northeast-2 | 0.704 |  |
| ap-northeast-3 | 0.621 |  |
| ap-south-1 | 0.875 |  |
| ap-south-2 | 0.926 |  |
| ap-southeast-1 | 0.853 |  |
| ap-southeast-2 | 0.758 |  |
| ap-southeast-3 | 0.923 |  |
| ap-southeast-4 | 0.798 |  |
| ap-southeast-5 | 0.875 |  |
| ap-southeast-6 | 0.811 |  |
| ap-southeast-7 | 0.956 |  |
| ca-central-1 | 0.107 | 16 |
| ca-west-1 | 0.246 |  |
| eu-central-1 | 0.411 |  |
| eu-central-2 | 0.435 |  |
| eu-north-1 | 0.466 |  |
| eu-south-1 | 0.443 |  |
| eu-south-2 | 0.447 |  |
| eu-west-1 | 0.341 |  |
| eu-west-2 | 0.370 |  |
| eu-west-3 | 0.396 |  |
| il-central-1 | 0.589 |  |
| me-central-1 | 0.799 |  |
| me-south-1 | 0.754 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.514 |  |
| us-east-1 | 0.073 | 4208 |
| us-east-2 | 0.084 | 1389 |
| us-gov-east-1 | 0.085 | 1521 |
| us-gov-west-1 | 0.270 | 167 |
| us-west-1 | 0.255 | 3155 |
| us-west-2 | 0.270 | 136 |

