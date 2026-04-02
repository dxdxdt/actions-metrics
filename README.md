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
Updated: 2026-04-02T20:28:33.373385+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.978 |  |
| ap-east-1 | 0.724 |  |
| ap-east-2 | 0.667 |  |
| ap-northeast-1 | 0.550 |  |
| ap-northeast-2 | 0.656 |  |
| ap-northeast-3 | 0.575 |  |
| ap-south-1 | 0.913 |  |
| ap-south-2 | 0.946 |  |
| ap-southeast-1 | 0.802 |  |
| ap-southeast-2 | 0.713 |  |
| ap-southeast-3 | 0.857 |  |
| ap-southeast-4 | 0.754 |  |
| ap-southeast-5 | 0.823 |  |
| ap-southeast-6 | 0.754 |  |
| ap-southeast-7 | 0.903 |  |
| ca-central-1 | 0.156 | 16 |
| ca-west-1 | 0.268 |  |
| eu-central-1 | 0.479 |  |
| eu-central-2 | 0.508 |  |
| eu-north-1 | 0.542 |  |
| eu-south-1 | 0.510 |  |
| eu-south-2 | 0.530 |  |
| eu-west-1 | 0.413 |  |
| eu-west-2 | 0.449 |  |
| eu-west-3 | 0.467 |  |
| il-central-1 | 0.670 |  |
| me-central-1 | 0.855 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.200 |  |
| sa-east-1 | 0.591 |  |
| us-east-1 | 0.130 | 4421 |
| us-east-2 | 0.122 | 1474 |
| us-gov-east-1 | 0.113 | 1622 |
| us-gov-west-1 | 0.224 | 191 |
| us-west-1 | 0.172 | 3338 |
| us-west-2 | 0.222 | 153 |

