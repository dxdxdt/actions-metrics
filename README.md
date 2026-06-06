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
Updated: 2026-06-06T23:03:39.768493+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.032 |  |
| ap-east-1 | 0.666 |  |
| ap-east-2 | 0.602 |  |
| ap-northeast-1 | 0.485 |  |
| ap-northeast-2 | 0.592 |  |
| ap-northeast-3 | 0.513 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.744 |  |
| ap-southeast-2 | 0.628 |  |
| ap-southeast-3 | 0.800 |  |
| ap-southeast-4 | 0.663 |  |
| ap-southeast-5 | 0.763 |  |
| ap-southeast-6 | 0.658 |  |
| ap-southeast-7 | 0.843 |  |
| ca-central-1 | 0.250 | 16 |
| ca-west-1 | 0.199 |  |
| eu-central-1 | 0.547 |  |
| eu-central-2 | 0.574 |  |
| eu-north-1 | 0.594 |  |
| eu-south-1 | 0.588 |  |
| eu-south-2 | 0.582 |  |
| eu-west-1 | 0.469 |  |
| eu-west-2 | 0.506 |  |
| eu-west-3 | 0.531 |  |
| il-central-1 | 0.706 |  |
| me-central-1 | 0.925 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.661 |  |
| us-east-1 | 0.220 | 4729 |
| us-east-2 | 0.177 | 1627 |
| us-gov-east-1 | 0.189 | 1709 |
| us-gov-west-1 | 0.149 | 197 |
| us-west-1 | 0.095 | 3640 |
| us-west-2 | 0.150 | 162 |

