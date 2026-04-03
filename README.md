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
Updated: 2026-04-03T10:37:04.062383+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.950 |  |
| ap-east-1 | 0.746 |  |
| ap-east-2 | 0.681 |  |
| ap-northeast-1 | 0.562 |  |
| ap-northeast-2 | 0.676 |  |
| ap-northeast-3 | 0.589 |  |
| ap-south-1 | 0.874 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.815 |  |
| ap-southeast-2 | 0.718 |  |
| ap-southeast-3 | 0.875 |  |
| ap-southeast-4 | 0.758 |  |
| ap-southeast-5 | 0.837 |  |
| ap-southeast-6 | 0.792 |  |
| ap-southeast-7 | 0.919 |  |
| ca-central-1 | 0.178 | 16 |
| ca-west-1 | 0.273 |  |
| eu-central-1 | 0.463 |  |
| eu-central-2 | 0.488 |  |
| eu-north-1 | 0.511 |  |
| eu-south-1 | 0.503 |  |
| eu-south-2 | 0.502 |  |
| eu-west-1 | 0.383 |  |
| eu-west-2 | 0.427 |  |
| eu-west-3 | 0.446 |  |
| il-central-1 | 0.670 |  |
| me-central-1 | 0.831 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.231 |  |
| sa-east-1 | 0.568 |  |
| us-east-1 | 0.127 | 4424 |
| us-east-2 | 0.138 | 1475 |
| us-gov-east-1 | 0.136 | 1622 |
| us-gov-west-1 | 0.240 | 191 |
| us-west-1 | 0.177 | 3344 |
| us-west-2 | 0.236 | 153 |

