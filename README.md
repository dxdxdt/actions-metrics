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
Updated: 2026-03-28T20:21:54.416459+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.024 |  |
| ap-east-1 | 0.692 |  |
| ap-east-2 | 0.626 |  |
| ap-northeast-1 | 0.509 |  |
| ap-northeast-2 | 0.613 |  |
| ap-northeast-3 | 0.537 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.764 |  |
| ap-southeast-2 | 0.654 |  |
| ap-southeast-3 | 0.823 |  |
| ap-southeast-4 | 0.694 |  |
| ap-southeast-5 | 0.785 |  |
| ap-southeast-6 | 0.698 |  |
| ap-southeast-7 | 0.869 |  |
| ca-central-1 | 0.217 | 16 |
| ca-west-1 | 0.254 |  |
| eu-central-1 | 0.525 |  |
| eu-central-2 | 0.540 |  |
| eu-north-1 | 0.574 |  |
| eu-south-1 | 0.556 |  |
| eu-south-2 | 0.576 |  |
| eu-west-1 | 0.457 |  |
| eu-west-2 | 0.476 |  |
| eu-west-3 | 0.505 |  |
| il-central-1 | 0.695 |  |
| me-central-1 | 0.898 |  |
| me-south-1 | 0.857 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.631 |  |
| us-east-1 | 0.181 | 4382 |
| us-east-2 | 0.164 | 1461 |
| us-gov-east-1 | 0.164 | 1611 |
| us-gov-west-1 | 0.178 | 190 |
| us-west-1 | 0.130 | 3316 |
| us-west-2 | 0.177 | 152 |

