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
Updated: 2026-08-14T18:42:42.557986+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.861 |  |
| ap-east-1 | 0.820 |  |
| ap-east-2 | 0.762 |  |
| ap-northeast-1 | 0.641 |  |
| ap-northeast-2 | 0.748 |  |
| ap-northeast-3 | 0.677 |  |
| ap-south-1 | 0.821 |  |
| ap-south-2 | 0.881 |  |
| ap-southeast-1 | 0.897 |  |
| ap-southeast-2 | 0.806 |  |
| ap-southeast-3 | 0.957 |  |
| ap-southeast-4 | 0.849 |  |
| ap-southeast-5 | 0.919 |  |
| ap-southeast-6 | 0.853 |  |
| ap-southeast-7 | 0.998 |  |
| ca-central-1 | 0.102 | 18 |
| ca-west-1 | 0.267 |  |
| eu-central-1 | 0.381 |  |
| eu-central-2 | 0.400 |  |
| eu-north-1 | 0.422 |  |
| eu-south-1 | 0.403 |  |
| eu-south-2 | 0.420 |  |
| eu-west-1 | 0.298 |  |
| eu-west-2 | 0.334 |  |
| eu-west-3 | 0.363 |  |
| il-central-1 | 0.540 |  |
| me-central-1 | 0.778 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.476 |  |
| us-east-1 | 0.044 | 4996 |
| us-east-2 | 0.075 | 1679 |
| us-gov-east-1 | 0.089 | 1827 |
| us-gov-west-1 | 0.325 | 222 |
| us-west-1 | 0.271 | 3946 |
| us-west-2 | 0.329 | 177 |

