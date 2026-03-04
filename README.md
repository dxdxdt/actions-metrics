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
Updated: 2026-03-04T20:25:38.106037+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.922 |  |
| ap-east-1 | 0.768 |  |
| ap-east-2 | 0.712 |  |
| ap-northeast-1 | 0.591 |  |
| ap-northeast-2 | 0.698 |  |
| ap-northeast-3 | 0.625 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.935 |  |
| ap-southeast-1 | 0.846 |  |
| ap-southeast-2 | 0.766 |  |
| ap-southeast-3 | 0.901 |  |
| ap-southeast-4 | 0.803 |  |
| ap-southeast-5 | 0.865 |  |
| ap-southeast-6 | 0.841 |  |
| ap-southeast-7 | 0.956 |  |
| ca-central-1 | 0.108 | 16 |
| ca-west-1 | 0.249 |  |
| eu-central-1 | 0.428 |  |
| eu-central-2 | 0.444 |  |
| eu-north-1 | 0.468 |  |
| eu-south-1 | 0.452 |  |
| eu-south-2 | 0.464 |  |
| eu-west-1 | 0.352 |  |
| eu-west-2 | 0.382 |  |
| eu-west-3 | 0.408 |  |
| il-central-1 | 0.593 |  |
| me-central-1 | 0.796 |  |
| me-south-1 | 0.766 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.529 |  |
| us-east-1 | 0.084 | 4220 |
| us-east-2 | 0.085 | 1397 |
| us-gov-east-1 | 0.081 | 1531 |
| us-gov-west-1 | 0.266 | 170 |
| us-west-1 | 0.241 | 3172 |
| us-west-2 | 0.280 | 140 |

