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
Updated: 2026-03-04T10:29:01.881385+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.995 |  |
| ap-east-1 | 0.713 |  |
| ap-east-2 | 0.642 |  |
| ap-northeast-1 | 0.522 |  |
| ap-northeast-2 | 0.629 |  |
| ap-northeast-3 | 0.547 |  |
| ap-south-1 | 0.903 |  |
| ap-south-2 | 0.940 |  |
| ap-southeast-1 | 0.775 |  |
| ap-southeast-2 | 0.680 |  |
| ap-southeast-3 | 0.829 |  |
| ap-southeast-4 | 0.724 |  |
| ap-southeast-5 | 0.792 |  |
| ap-southeast-6 | 0.720 |  |
| ap-southeast-7 | 0.877 |  |
| ca-central-1 | 0.190 | 16 |
| ca-west-1 | 0.196 |  |
| eu-central-1 | 0.518 |  |
| eu-central-2 | 0.520 |  |
| eu-north-1 | 0.555 |  |
| eu-south-1 | 0.533 |  |
| eu-south-2 | 0.558 |  |
| eu-west-1 | 0.440 |  |
| eu-west-2 | 0.466 |  |
| eu-west-3 | 0.489 |  |
| il-central-1 | 0.680 |  |
| me-central-1 | 0.905 |  |
| me-south-1 | 0.853 |  |
| mx-central-1 | 0.213 |  |
| sa-east-1 | 0.614 |  |
| us-east-1 | 0.172 | 4216 |
| us-east-2 | 0.132 | 1397 |
| us-gov-east-1 | 0.133 | 1529 |
| us-gov-west-1 | 0.177 | 169 |
| us-west-1 | 0.171 | 3169 |
| us-west-2 | 0.176 | 140 |

