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
Updated: 2026-02-22T13:39:11.688865+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.966 |  |
| ap-east-1 | 0.735 |  |
| ap-east-2 | 0.682 |  |
| ap-northeast-1 | 0.570 |  |
| ap-northeast-2 | 0.665 |  |
| ap-northeast-3 | 0.585 |  |
| ap-south-1 | 0.893 |  |
| ap-south-2 | 0.932 |  |
| ap-southeast-1 | 0.815 |  |
| ap-southeast-2 | 0.724 |  |
| ap-southeast-3 | 0.869 |  |
| ap-southeast-4 | 0.768 |  |
| ap-southeast-5 | 0.833 |  |
| ap-southeast-6 | 0.766 |  |
| ap-southeast-7 | 0.917 |  |
| ca-central-1 | 0.130 | 16 |
| ca-west-1 | 0.208 |  |
| eu-central-1 | 0.465 |  |
| eu-central-2 | 0.478 |  |
| eu-north-1 | 0.508 |  |
| eu-south-1 | 0.491 |  |
| eu-south-2 | 0.500 |  |
| eu-west-1 | 0.391 |  |
| eu-west-2 | 0.418 |  |
| eu-west-3 | 0.443 |  |
| il-central-1 | 0.648 |  |
| me-central-1 | 0.841 |  |
| me-south-1 | 0.798 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.575 |  |
| us-east-1 | 0.107 | 4161 |
| us-east-2 | 0.088 | 1371 |
| us-gov-east-1 | 0.088 | 1500 |
| us-gov-west-1 | 0.216 | 160 |
| us-west-1 | 0.223 | 3097 |
| us-west-2 | 0.225 | 129 |

