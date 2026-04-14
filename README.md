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
Updated: 2026-04-14T11:53:58.362403+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.873 |  |
| ap-east-1 | 0.819 |  |
| ap-east-2 | 0.760 |  |
| ap-northeast-1 | 0.631 |  |
| ap-northeast-2 | 0.764 |  |
| ap-northeast-3 | 0.653 |  |
| ap-south-1 | 0.845 |  |
| ap-south-2 | 0.940 |  |
| ap-southeast-1 | 0.913 |  |
| ap-southeast-2 | 0.822 |  |
| ap-southeast-3 | 0.954 |  |
| ap-southeast-4 | 0.868 |  |
| ap-southeast-5 | 0.932 |  |
| ap-southeast-6 | 0.849 |  |
| ap-southeast-7 | 1.001 |  |
| ca-central-1 | 0.113 | 16 |
| ca-west-1 | 0.303 |  |
| eu-central-1 | 0.382 |  |
| eu-central-2 | 0.403 |  |
| eu-north-1 | 0.444 |  |
| eu-south-1 | 0.409 |  |
| eu-south-2 | 0.416 |  |
| eu-west-1 | 0.307 |  |
| eu-west-2 | 0.344 |  |
| eu-west-3 | 0.362 |  |
| il-central-1 | 0.554 |  |
| me-central-1 | 0.753 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.484 |  |
| us-east-1 | 0.054 | 4501 |
| us-east-2 | 0.102 | 1499 |
| us-gov-east-1 | 0.107 | 1646 |
| us-gov-west-1 | 0.349 | 193 |
| us-west-1 | 0.281 | 3410 |
| us-west-2 | 0.329 | 155 |

