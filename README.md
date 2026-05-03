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
Updated: 2026-05-03T14:08:11.378233+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.030 |  |
| ap-east-1 | 0.668 |  |
| ap-east-2 | 0.608 |  |
| ap-northeast-1 | 0.494 |  |
| ap-northeast-2 | 0.600 |  |
| ap-northeast-3 | 0.519 |  |
| ap-south-1 | 0.897 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.744 |  |
| ap-southeast-2 | 0.635 |  |
| ap-southeast-3 | 0.797 |  |
| ap-southeast-4 | 0.679 |  |
| ap-southeast-5 | 0.766 |  |
| ap-southeast-6 | 0.697 |  |
| ap-southeast-7 | 0.849 |  |
| ca-central-1 | 0.250 | 16 |
| ca-west-1 | 0.221 |  |
| eu-central-1 | 0.574 |  |
| eu-central-2 | 0.572 |  |
| eu-north-1 | 0.598 |  |
| eu-south-1 | 0.578 |  |
| eu-south-2 | 0.598 |  |
| eu-west-1 | 0.482 |  |
| eu-west-2 | 0.508 |  |
| eu-west-3 | 0.519 |  |
| il-central-1 | 0.708 |  |
| me-central-1 | 0.911 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.223 |  |
| sa-east-1 | 0.658 |  |
| us-east-1 | 0.205 | 4590 |
| us-east-2 | 0.182 | 1561 |
| us-gov-east-1 | 0.184 | 1671 |
| us-gov-west-1 | 0.155 | 194 |
| us-west-1 | 0.100 | 3524 |
| us-west-2 | 0.155 | 157 |

