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
Updated: 2026-02-03T19:40:29.134836+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.056 |  |
| ap-east-1 | 0.664 |  |
| ap-northeast-1 | 0.462 |  |
| ap-northeast-2 | 0.570 |  |
| ap-south-1 | 0.899 |  |
| ap-southeast-1 | 0.723 |  |
| ap-southeast-2 | 0.599 |  |
| ca-central-1 | 0.278 | 16 |
| ca-west-1 | 0.176 |  |
| eu-central-1 | 0.577 |  |
| eu-north-1 | 0.623 |  |
| eu-south-1 | 0.605 |  |
| eu-west-1 | 0.503 |  |
| eu-west-2 | 0.528 |  |
| eu-west-3 | 0.546 |  |
| me-south-1 | 0.906 |  |
| sa-east-1 | 0.689 |  |
| us-east-1 | 0.242 | 4055 |
| us-east-2 | 0.214 | 1310 |
| us-gov-east-1 | 0.216 | 1427 |
| us-gov-west-1 | 0.119 | 134 |
| us-west-1 | 0.073 | 2989 |
| us-west-2 | 0.130 | 124 |

