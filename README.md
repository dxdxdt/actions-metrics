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
Updated: 2026-07-03T20:55:37.393157+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.913 |  |
| ap-east-1 | 0.781 |  |
| ap-east-2 | 0.721 |  |
| ap-northeast-1 | 0.606 |  |
| ap-northeast-2 | 0.705 |  |
| ap-northeast-3 | 0.630 |  |
| ap-south-1 | 0.859 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.858 |  |
| ap-southeast-2 | 0.744 |  |
| ap-southeast-3 | 0.912 |  |
| ap-southeast-4 | 0.784 |  |
| ap-southeast-5 | 0.867 |  |
| ap-southeast-6 | 0.772 |  |
| ap-southeast-7 | 0.948 |  |
| ca-central-1 | 0.139 | 16 |
| ca-west-1 | 0.275 |  |
| eu-central-1 | 0.429 |  |
| eu-central-2 | 0.452 |  |
| eu-north-1 | 0.482 |  |
| eu-south-1 | 0.457 |  |
| eu-south-2 | 0.459 |  |
| eu-west-1 | 0.345 |  |
| eu-west-2 | 0.376 |  |
| eu-west-3 | 0.414 |  |
| il-central-1 | 0.578 |  |
| me-central-1 | 0.823 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.223 |  |
| sa-east-1 | 0.539 |  |
| us-east-1 | 0.097 | 4814 |
| us-east-2 | 0.096 | 1652 |
| us-gov-east-1 | 0.103 | 1728 |
| us-gov-west-1 | 0.276 | 200 |
| us-west-1 | 0.211 | 3735 |
| us-west-2 | 0.274 | 164 |

