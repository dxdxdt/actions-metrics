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
Updated: 2026-05-24T02:33:02.294443+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.917 |  |
| ap-east-1 | 0.779 |  |
| ap-east-2 | 0.724 |  |
| ap-northeast-1 | 0.596 |  |
| ap-northeast-2 | 0.710 |  |
| ap-northeast-3 | 0.622 |  |
| ap-south-1 | 0.849 |  |
| ap-south-2 | 0.884 |  |
| ap-southeast-1 | 0.846 |  |
| ap-southeast-2 | 0.764 |  |
| ap-southeast-3 | 0.899 |  |
| ap-southeast-4 | 0.805 |  |
| ap-southeast-5 | 0.869 |  |
| ap-southeast-6 | 0.793 |  |
| ap-southeast-7 | 0.959 |  |
| ca-central-1 | 0.118 | 16 |
| ca-west-1 | 0.274 |  |
| eu-central-1 | 0.416 |  |
| eu-central-2 | 0.434 |  |
| eu-north-1 | 0.452 |  |
| eu-south-1 | 0.441 |  |
| eu-south-2 | 0.450 |  |
| eu-west-1 | 0.332 |  |
| eu-west-2 | 0.370 |  |
| eu-west-3 | 0.397 |  |
| il-central-1 | 0.577 |  |
| me-central-1 | 0.797 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.222 |  |
| sa-east-1 | 0.520 |  |
| us-east-1 | 0.079 | 4682 |
| us-east-2 | 0.087 | 1609 |
| us-gov-east-1 | 0.089 | 1704 |
| us-gov-west-1 | 0.282 | 195 |
| us-west-1 | 0.233 | 3592 |
| us-west-2 | 0.279 | 159 |

