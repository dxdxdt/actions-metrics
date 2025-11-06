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
Updated: 2025-11-06T16:17:34.447469+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.961 |  |
| ap-east-1 | 0.746 |  |
| ap-northeast-1 | 0.548 |  |
| ap-northeast-2 | 0.657 |  |
| ap-south-1 | 0.857 |  |
| ap-southeast-1 | 0.806 |  |
| ap-southeast-2 | 0.718 |  |
| ca-central-1 | 0.161 | 15 |
| eu-central-1 | 0.483 |  |
| eu-north-1 | 0.525 |  |
| eu-south-1 | 0.496 |  |
| eu-west-1 | 0.396 |  |
| eu-west-2 | 0.428 |  |
| eu-west-3 | 0.449 |  |
| me-south-1 | 0.803 |  |
| sa-east-1 | 0.584 |  |
| us-east-1 | 0.134 | 3451 |
| us-east-2 | 0.128 | 1019 |
| us-gov-east-1 | 0.117 | 1143 |
| us-gov-west-1 | 0.214 | 74 |
| us-west-1 | 0.198 | 2373 |
| us-west-2 | 0.210 | 23 |

