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
Updated: 2026-03-17T05:54:29.793952+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.915 |  |
| ap-east-1 | 0.772 |  |
| ap-east-2 | 0.718 |  |
| ap-northeast-1 | 0.594 |  |
| ap-northeast-2 | 0.701 |  |
| ap-northeast-3 | 0.623 |  |
| ap-south-1 | 0.913 |  |
| ap-south-2 | 0.909 |  |
| ap-southeast-1 | 0.848 |  |
| ap-southeast-2 | 0.769 |  |
| ap-southeast-3 | 0.905 |  |
| ap-southeast-4 | 0.812 |  |
| ap-southeast-5 | 0.875 |  |
| ap-southeast-6 | 0.809 |  |
| ap-southeast-7 | 0.950 |  |
| ca-central-1 | 0.107 | 16 |
| ca-west-1 | 0.239 |  |
| eu-central-1 | 0.421 |  |
| eu-central-2 | 0.453 |  |
| eu-north-1 | 0.482 |  |
| eu-south-1 | 0.450 |  |
| eu-south-2 | 0.472 |  |
| eu-west-1 | 0.340 |  |
| eu-west-2 | 0.379 |  |
| eu-west-3 | 0.404 |  |
| il-central-1 | 0.591 |  |
| me-central-1 | 0.789 |  |
| me-south-1 | 0.756 |  |
| mx-central-1 | 0.231 |  |
| sa-east-1 | 0.518 |  |
| us-east-1 | 0.080 | 4295 |
| us-east-2 | 0.087 | 1429 |
| us-gov-east-1 | 0.079 | 1580 |
| us-gov-west-1 | 0.255 | 186 |
| us-west-1 | 0.254 | 3244 |
| us-west-2 | 0.257 | 148 |

