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
Updated: 2026-08-05T22:13:13.560855+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.925 |  |
| ap-east-1 | 0.770 |  |
| ap-east-2 | 0.710 |  |
| ap-northeast-1 | 0.592 |  |
| ap-northeast-2 | 0.693 |  |
| ap-northeast-3 | 0.618 |  |
| ap-south-1 | 0.841 |  |
| ap-south-2 | 0.894 |  |
| ap-southeast-1 | 0.843 |  |
| ap-southeast-2 | 0.745 |  |
| ap-southeast-3 | 0.891 |  |
| ap-southeast-4 | 0.786 |  |
| ap-southeast-5 | 0.864 |  |
| ap-southeast-6 | 0.792 |  |
| ap-southeast-7 | 0.948 |  |
| ca-central-1 | 0.157 | 17 |
| ca-west-1 | 0.286 |  |
| eu-central-1 | 0.435 |  |
| eu-central-2 | 0.457 |  |
| eu-north-1 | 0.483 |  |
| eu-south-1 | 0.452 |  |
| eu-south-2 | 0.471 |  |
| eu-west-1 | 0.349 |  |
| eu-west-2 | 0.382 |  |
| eu-west-3 | 0.416 |  |
| il-central-1 | 0.585 |  |
| me-central-1 | 0.792 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.540 |  |
| us-east-1 | 0.101 | 4945 |
| us-east-2 | 0.114 | 1674 |
| us-gov-east-1 | 0.124 | 1803 |
| us-gov-west-1 | 0.269 | 211 |
| us-west-1 | 0.215 | 3887 |
| us-west-2 | 0.269 | 172 |

