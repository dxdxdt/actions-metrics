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
Updated: 2026-01-21T11:17:52.424036+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.907 |  |
| ap-east-1 | 0.790 |  |
| ap-northeast-1 | 0.595 |  |
| ap-northeast-2 | 0.710 |  |
| ap-south-1 | 0.881 |  |
| ap-southeast-1 | 0.862 |  |
| ap-southeast-2 | 0.758 |  |
| ca-central-1 | 0.115 | 16 |
| eu-central-1 | 0.415 |  |
| eu-north-1 | 0.466 |  |
| eu-south-1 | 0.448 |  |
| eu-west-1 | 0.351 |  |
| eu-west-2 | 0.374 |  |
| eu-west-3 | 0.402 |  |
| me-south-1 | 0.788 |  |
| sa-east-1 | 0.522 |  |
| us-east-1 | 0.080 | 3976 |
| us-east-2 | 0.090 | 1269 |
| us-gov-east-1 | 0.088 | 1385 |
| us-gov-west-1 | 0.279 | 124 |
| us-west-1 | 0.239 | 2894 |
| us-west-2 | 0.264 | 108 |

