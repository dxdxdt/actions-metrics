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
Updated: 2026-08-10T20:33:20.258707+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.879 |  |
| ap-east-1 | 0.807 |  |
| ap-east-2 | 0.748 |  |
| ap-northeast-1 | 0.635 |  |
| ap-northeast-2 | 0.741 |  |
| ap-northeast-3 | 0.654 |  |
| ap-south-1 | 0.840 |  |
| ap-south-2 | 0.913 |  |
| ap-southeast-1 | 0.887 |  |
| ap-southeast-2 | 0.788 |  |
| ap-southeast-3 | 0.941 |  |
| ap-southeast-4 | 0.837 |  |
| ap-southeast-5 | 0.906 |  |
| ap-southeast-6 | 0.829 |  |
| ap-southeast-7 | 0.986 |  |
| ca-central-1 | 0.106 | 18 |
| ca-west-1 | 0.263 |  |
| eu-central-1 | 0.398 |  |
| eu-central-2 | 0.409 |  |
| eu-north-1 | 0.444 |  |
| eu-south-1 | 0.426 |  |
| eu-south-2 | 0.428 |  |
| eu-west-1 | 0.316 |  |
| eu-west-2 | 0.350 |  |
| eu-west-3 | 0.373 |  |
| il-central-1 | 0.593 |  |
| me-central-1 | 0.770 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.243 |  |
| sa-east-1 | 0.492 |  |
| us-east-1 | 0.057 | 4972 |
| us-east-2 | 0.080 | 1678 |
| us-gov-east-1 | 0.090 | 1817 |
| us-gov-west-1 | 0.317 | 216 |
| us-west-1 | 0.269 | 3917 |
| us-west-2 | 0.316 | 176 |

