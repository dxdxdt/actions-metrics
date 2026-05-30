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
Updated: 2026-05-30T11:14:51.465226+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.042 |  |
| ap-east-1 | 0.652 |  |
| ap-east-2 | 0.589 |  |
| ap-northeast-1 | 0.476 |  |
| ap-northeast-2 | 0.582 |  |
| ap-northeast-3 | 0.502 |  |
| ap-south-1 | 0.945 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.730 |  |
| ap-southeast-2 | 0.623 |  |
| ap-southeast-3 | 0.783 |  |
| ap-southeast-4 | 0.663 |  |
| ap-southeast-5 | 0.749 |  |
| ap-southeast-6 | 0.670 |  |
| ap-southeast-7 | 0.833 |  |
| ca-central-1 | 0.266 | 16 |
| ca-west-1 | 0.332 |  |
| eu-central-1 | 0.561 |  |
| eu-central-2 | 0.575 |  |
| eu-north-1 | 0.585 |  |
| eu-south-1 | 0.575 |  |
| eu-south-2 | 0.592 |  |
| eu-west-1 | 0.464 |  |
| eu-west-2 | 0.517 |  |
| eu-west-3 | 0.533 |  |
| il-central-1 | 0.705 |  |
| me-central-1 | 1.016 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.214 |  |
| sa-east-1 | 0.674 |  |
| us-east-1 | 0.225 | 4699 |
| us-east-2 | 0.210 | 1614 |
| us-gov-east-1 | 0.190 | 1708 |
| us-gov-west-1 | 0.142 | 195 |
| us-west-1 | 0.086 | 3620 |
| us-west-2 | 0.143 | 161 |

