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
Updated: 2026-09-19T14:04:50.150773+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.942 |  |
| ap-east-1 | 0.736 |  |
| ap-east-2 | 0.678 |  |
| ap-northeast-1 | 0.558 |  |
| ap-northeast-2 | 0.661 |  |
| ap-northeast-3 | 0.585 |  |
| ap-south-1 | 0.879 |  |
| ap-south-2 | 0.957 |  |
| ap-southeast-1 | 0.839 |  |
| ap-southeast-2 | 0.710 |  |
| ap-southeast-3 | 0.869 |  |
| ap-southeast-4 | 0.754 |  |
| ap-southeast-5 | 0.833 |  |
| ap-southeast-6 | 0.755 |  |
| ap-southeast-7 | 0.919 |  |
| ca-central-1 | 0.149 | 18 |
| ca-west-1 | 0.239 |  |
| eu-central-1 | 0.471 |  |
| eu-central-2 | 0.473 |  |
| eu-north-1 | 0.504 |  |
| eu-south-1 | 0.483 |  |
| eu-south-2 | 0.502 |  |
| eu-west-1 | 0.380 |  |
| eu-west-2 | 0.415 |  |
| eu-west-3 | 0.444 |  |
| il-central-1 | 0.620 |  |
| me-central-1 | 0.841 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.583 |  |
| us-east-1 | 0.113 | 5106 |
| us-east-2 | 0.120 | 1686 |
| us-gov-east-1 | 0.104 | 1919 |
| us-gov-west-1 | 0.233 | 234 |
| us-west-1 | 0.174 | 4126 |
| us-west-2 | 0.232 | 192 |

