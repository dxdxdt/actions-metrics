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
Updated: 2026-03-27T11:37:07.519700+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.939 |  |
| ap-east-1 | 0.744 |  |
| ap-east-2 | 0.678 |  |
| ap-northeast-1 | 0.566 |  |
| ap-northeast-2 | 0.678 |  |
| ap-northeast-3 | 0.591 |  |
| ap-south-1 | 0.865 |  |
| ap-south-2 | 0.949 |  |
| ap-southeast-1 | 0.828 |  |
| ap-southeast-2 | 0.738 |  |
| ap-southeast-3 | 0.880 |  |
| ap-southeast-4 | 0.764 |  |
| ap-southeast-5 | 0.845 |  |
| ap-southeast-6 | 0.771 |  |
| ap-southeast-7 | 0.932 |  |
| ca-central-1 | 0.163 | 16 |
| ca-west-1 | 0.260 |  |
| eu-central-1 | 0.450 |  |
| eu-central-2 | 0.475 |  |
| eu-north-1 | 0.517 |  |
| eu-south-1 | 0.483 |  |
| eu-south-2 | 0.517 |  |
| eu-west-1 | 0.382 |  |
| eu-west-2 | 0.418 |  |
| eu-west-3 | 0.426 |  |
| il-central-1 | 0.621 |  |
| me-central-1 | 0.837 |  |
| me-south-1 | 0.795 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.562 |  |
| us-east-1 | 0.117 | 4370 |
| us-east-2 | 0.132 | 1458 |
| us-gov-east-1 | 0.131 | 1608 |
| us-gov-west-1 | 0.251 | 190 |
| us-west-1 | 0.203 | 3306 |
| us-west-2 | 0.252 | 151 |

