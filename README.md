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
Updated: 2026-08-10T21:34:02.841865+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.967 |  |
| ap-east-1 | 0.720 |  |
| ap-east-2 | 0.655 |  |
| ap-northeast-1 | 0.541 |  |
| ap-northeast-2 | 0.642 |  |
| ap-northeast-3 | 0.566 |  |
| ap-south-1 | 0.893 |  |
| ap-south-2 | 0.909 |  |
| ap-southeast-1 | 0.808 |  |
| ap-southeast-2 | 0.695 |  |
| ap-southeast-3 | 0.858 |  |
| ap-southeast-4 | 0.746 |  |
| ap-southeast-5 | 0.825 |  |
| ap-southeast-6 | 0.742 |  |
| ap-southeast-7 | 0.910 |  |
| ca-central-1 | 0.211 | 18 |
| ca-west-1 | 0.238 |  |
| eu-central-1 | 0.479 |  |
| eu-central-2 | 0.492 |  |
| eu-north-1 | 0.529 |  |
| eu-south-1 | 0.426 |  |
| eu-south-2 | 0.507 |  |
| eu-west-1 | 0.425 |  |
| eu-west-2 | 0.444 |  |
| eu-west-3 | 0.450 |  |
| il-central-1 | 0.666 |  |
| me-central-1 | 0.846 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.218 |  |
| sa-east-1 | 0.590 |  |
| us-east-1 | 0.140 | 4972 |
| us-east-2 | 0.170 | 1678 |
| us-gov-east-1 | 0.173 | 1817 |
| us-gov-west-1 | 0.234 | 216 |
| us-west-1 | 0.175 | 3918 |
| us-west-2 | 0.232 | 176 |

