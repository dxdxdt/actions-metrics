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
Updated: 2026-08-18T09:24:11.494969+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.940 |  |
| ap-east-1 | 0.743 |  |
| ap-east-2 | 0.680 |  |
| ap-northeast-1 | 0.560 |  |
| ap-northeast-2 | 0.673 |  |
| ap-northeast-3 | 0.586 |  |
| ap-south-1 | 0.869 |  |
| ap-south-2 | 0.867 |  |
| ap-southeast-1 | 0.804 |  |
| ap-southeast-2 | 0.730 |  |
| ap-southeast-3 | 0.867 |  |
| ap-southeast-4 | 0.775 |  |
| ap-southeast-5 | 0.836 |  |
| ap-southeast-6 | 0.762 |  |
| ap-southeast-7 | 0.922 |  |
| ca-central-1 | 0.167 | 18 |
| ca-west-1 | 0.192 |  |
| eu-central-1 | 0.454 |  |
| eu-central-2 | 0.476 |  |
| eu-north-1 | 0.511 |  |
| eu-south-1 | 0.477 |  |
| eu-south-2 | 0.491 |  |
| eu-west-1 | 0.373 |  |
| eu-west-2 | 0.411 |  |
| eu-west-3 | 0.435 |  |
| il-central-1 | 0.607 |  |
| me-central-1 | 0.856 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.556 |  |
| us-east-1 | 0.116 | 5016 |
| us-east-2 | 0.140 | 1680 |
| us-gov-east-1 | 0.146 | 1843 |
| us-gov-west-1 | 0.235 | 224 |
| us-west-1 | 0.211 | 3985 |
| us-west-2 | 0.234 | 182 |

