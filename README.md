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
Updated: 2026-11-06T22:35:20.278003+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.743 |  |
| ap-east-1 | 0.508 |  |
| ap-east-2 | 0.470 |  |
| ap-northeast-1 | 0.372 |  |
| ap-northeast-2 | 0.450 |  |
| ap-northeast-3 | 0.392 |  |
| ap-south-1 | 0.669 |  |
| ap-south-2 | 0.665 |  |
| ap-southeast-1 | 0.568 |  |
| ap-southeast-2 | 0.507 |  |
| ap-southeast-3 | 0.609 |  |
| ap-southeast-4 | 0.554 |  |
| ap-southeast-5 | 0.582 |  |
| ap-southeast-6 | 0.533 |  |
| ap-southeast-7 | 0.647 |  |
| ca-central-1 | 0.171 | 18 |
| ca-west-1 | 0.173 |  |
| eu-central-1 | 0.383 |  |
| eu-central-2 | 0.404 |  |
| eu-north-1 | 0.415 |  |
| eu-south-1 | 0.396 |  |
| eu-south-2 | 0.392 |  |
| eu-west-1 | 0.330 |  |
| eu-west-2 | 0.357 |  |
| eu-west-3 | 0.374 |  |
| il-central-1 | 0.504 |  |
| me-central-1 | 0.651 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.180 |  |
| sa-east-1 | 0.469 |  |
| us-east-1 | 0.136 | 5174 |
| us-east-2 | 0.153 | 1721 |
| us-gov-east-1 | 0.151 | 1959 |
| us-gov-west-1 | 0.140 | 245 |
| us-west-1 | 0.110 | 4208 |
| us-west-2 | 0.141 | 196 |

