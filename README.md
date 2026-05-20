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
Updated: 2026-05-20T16:47:46.821504+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.865 |  |
| ap-east-1 | 0.835 |  |
| ap-east-2 | 0.770 |  |
| ap-northeast-1 | 0.634 |  |
| ap-northeast-2 | 0.772 |  |
| ap-northeast-3 | 0.665 |  |
| ap-south-1 | 0.830 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.905 |  |
| ap-southeast-2 | 0.812 |  |
| ap-southeast-3 | 0.955 |  |
| ap-southeast-4 | 0.855 |  |
| ap-southeast-5 | 0.923 |  |
| ap-southeast-6 | 0.861 |  |
| ap-southeast-7 | 1.015 |  |
| ca-central-1 | 0.106 | 16 |
| ca-west-1 | 0.294 |  |
| eu-central-1 | 0.378 |  |
| eu-central-2 | 0.395 |  |
| eu-north-1 | 0.419 |  |
| eu-south-1 | 0.399 |  |
| eu-south-2 | 0.414 |  |
| eu-west-1 | 0.297 |  |
| eu-west-2 | 0.329 |  |
| eu-west-3 | 0.359 |  |
| il-central-1 | 0.534 |  |
| me-central-1 | 0.776 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.482 |  |
| us-east-1 | 0.049 | 4668 |
| us-east-2 | 0.087 | 1603 |
| us-gov-east-1 | 0.093 | 1699 |
| us-gov-west-1 | 0.338 | 195 |
| us-west-1 | 0.276 | 3581 |
| us-west-2 | 0.340 | 158 |

