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
Updated: 2026-07-28T19:11:19.120624+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.069 |  |
| ap-east-1 | 0.630 |  |
| ap-east-2 | 0.582 |  |
| ap-northeast-1 | 0.459 |  |
| ap-northeast-2 | 0.567 |  |
| ap-northeast-3 | 0.485 |  |
| ap-south-1 | 0.916 |  |
| ap-south-2 | 0.888 |  |
| ap-southeast-1 | 0.712 |  |
| ap-southeast-2 | 0.596 |  |
| ap-southeast-3 | 0.768 |  |
| ap-southeast-4 | 0.636 |  |
| ap-southeast-5 | 0.737 |  |
| ap-southeast-6 | 0.629 |  |
| ap-southeast-7 | 0.821 |  |
| ca-central-1 | 0.305 | 17 |
| ca-west-1 | 0.181 |  |
| eu-central-1 | 0.579 |  |
| eu-central-2 | 0.600 |  |
| eu-north-1 | 0.635 |  |
| eu-south-1 | 0.615 |  |
| eu-south-2 | 0.616 |  |
| eu-west-1 | 0.495 |  |
| eu-west-2 | 0.537 |  |
| eu-west-3 | 0.566 |  |
| il-central-1 | 0.736 |  |
| me-central-1 | 0.960 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.243 |  |
| sa-east-1 | 0.691 |  |
| us-east-1 | 0.248 | 4916 |
| us-east-2 | 0.212 | 1670 |
| us-gov-east-1 | 0.221 | 1782 |
| us-gov-west-1 | 0.119 | 207 |
| us-west-1 | 0.067 | 3849 |
| us-west-2 | 0.117 | 171 |

