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
Updated: 2026-03-23T01:26:19.175914+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.963 |  |
| ap-east-1 | 0.717 |  |
| ap-east-2 | 0.654 |  |
| ap-northeast-1 | 0.530 |  |
| ap-northeast-2 | 0.638 |  |
| ap-northeast-3 | 0.557 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.881 |  |
| ap-southeast-1 | 0.791 |  |
| ap-southeast-2 | 0.702 |  |
| ap-southeast-3 | 0.848 |  |
| ap-southeast-4 | 0.740 |  |
| ap-southeast-5 | 0.817 |  |
| ap-southeast-6 | 0.745 |  |
| ap-southeast-7 | 0.899 |  |
| ca-central-1 | 0.206 | 16 |
| ca-west-1 | 0.259 |  |
| eu-central-1 | 0.482 |  |
| eu-central-2 | 0.505 |  |
| eu-north-1 | 0.531 |  |
| eu-south-1 | 0.513 |  |
| eu-south-2 | 0.514 |  |
| eu-west-1 | 0.408 |  |
| eu-west-2 | 0.444 |  |
| eu-west-3 | 0.448 |  |
| il-central-1 | 0.660 |  |
| me-central-1 | 0.868 |  |
| me-south-1 | 0.826 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.582 |  |
| us-east-1 | 0.141 | 4336 |
| us-east-2 | 0.156 | 1447 |
| us-gov-east-1 | 0.159 | 1595 |
| us-gov-west-1 | 0.229 | 189 |
| us-west-1 | 0.168 | 3283 |
| us-west-2 | 0.228 | 151 |

