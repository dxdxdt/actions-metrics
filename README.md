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
Updated: 2026-02-16T09:44:42.275629+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.989 |  |
| ap-east-1 | 0.704 |  |
| ap-east-2 | 0.643 |  |
| ap-northeast-1 | 0.519 |  |
| ap-northeast-2 | 0.635 |  |
| ap-south-1 | 0.892 |  |
| ap-south-2 | 0.898 |  |
| ap-southeast-1 | 0.779 |  |
| ap-southeast-2 | 0.664 |  |
| ap-southeast-3 | 0.857 |  |
| ap-southeast-4 | 0.710 |  |
| ap-southeast-5 | 0.805 |  |
| ap-southeast-6 | 0.716 |  |
| ap-southeast-7 | 0.892 |  |
| ca-central-1 | 0.213 | 16 |
| ca-west-1 | 0.211 |  |
| eu-central-1 | 0.506 |  |
| eu-central-2 | 0.527 |  |
| eu-north-1 | 0.574 |  |
| eu-south-1 | 0.549 |  |
| eu-south-2 | 0.543 |  |
| eu-west-1 | 0.423 |  |
| eu-west-2 | 0.469 |  |
| eu-west-3 | 0.488 |  |
| il-central-1 | 0.694 |  |
| me-central-1 | 0.924 |  |
| me-south-1 | 0.872 |  |
| mx-central-1 | 0.255 |  |
| sa-east-1 | 0.611 |  |
| us-east-1 | 0.170 | 4129 |
| us-east-2 | 0.165 | 1348 |
| us-gov-east-1 | 0.170 | 1476 |
| us-gov-west-1 | 0.192 | 149 |
| us-west-1 | 0.151 | 3064 |
| us-west-2 | 0.193 | 125 |

