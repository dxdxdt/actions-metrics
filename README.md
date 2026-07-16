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
Updated: 2026-07-16T23:53:11.377539+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.952 |  |
| ap-east-1 | 0.734 |  |
| ap-east-2 | 0.678 |  |
| ap-northeast-1 | 0.558 |  |
| ap-northeast-2 | 0.663 |  |
| ap-northeast-3 | 0.581 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.974 |  |
| ap-southeast-1 | 0.810 |  |
| ap-southeast-2 | 0.710 |  |
| ap-southeast-3 | 0.868 |  |
| ap-southeast-4 | 0.758 |  |
| ap-southeast-5 | 0.831 |  |
| ap-southeast-6 | 0.740 |  |
| ap-southeast-7 | 0.911 |  |
| ca-central-1 | 0.132 | 16 |
| ca-west-1 | 0.197 |  |
| eu-central-1 | 0.467 |  |
| eu-central-2 | 0.496 |  |
| eu-north-1 | 0.529 |  |
| eu-south-1 | 0.506 |  |
| eu-south-2 | 0.528 |  |
| eu-west-1 | 0.411 |  |
| eu-west-2 | 0.437 |  |
| eu-west-3 | 0.451 |  |
| il-central-1 | 0.649 |  |
| me-central-1 | 0.834 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.196 |  |
| sa-east-1 | 0.583 |  |
| us-east-1 | 0.109 | 4874 |
| us-east-2 | 0.117 | 1656 |
| us-gov-east-1 | 0.081 | 1761 |
| us-gov-west-1 | 0.228 | 202 |
| us-west-1 | 0.174 | 3789 |
| us-west-2 | 0.227 | 166 |

