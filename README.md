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
Updated: 2026-08-19T08:27:02.832488+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.879 |  |
| ap-east-1 | 0.796 |  |
| ap-east-2 | 0.732 |  |
| ap-northeast-1 | 0.614 |  |
| ap-northeast-2 | 0.736 |  |
| ap-northeast-3 | 0.638 |  |
| ap-south-1 | 0.832 |  |
| ap-south-2 | 1.000 |  |
| ap-southeast-1 | 0.877 |  |
| ap-southeast-2 | 0.769 |  |
| ap-southeast-3 | 0.938 |  |
| ap-southeast-4 | 0.816 |  |
| ap-southeast-5 | 0.900 |  |
| ap-southeast-6 | 0.814 |  |
| ap-southeast-7 | 0.982 |  |
| ca-central-1 | 0.112 | 18 |
| ca-west-1 | 0.225 |  |
| eu-central-1 | 0.393 |  |
| eu-central-2 | 0.409 |  |
| eu-north-1 | 0.447 |  |
| eu-south-1 | 0.428 |  |
| eu-south-2 | 0.430 |  |
| eu-west-1 | 0.321 |  |
| eu-west-2 | 0.344 |  |
| eu-west-3 | 0.371 |  |
| il-central-1 | 0.568 |  |
| me-central-1 | 0.786 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.503 |  |
| us-east-1 | 0.058 | 5021 |
| us-east-2 | 0.081 | 1680 |
| us-gov-east-1 | 0.091 | 1852 |
| us-gov-west-1 | 0.306 | 224 |
| us-west-1 | 0.249 | 3993 |
| us-west-2 | 0.306 | 182 |

