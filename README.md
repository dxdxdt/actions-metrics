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
Updated: 2026-11-23T22:20:19.030952+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.746 |  |
| ap-east-1 | 0.507 |  |
| ap-east-2 | 0.463 |  |
| ap-northeast-1 | 0.368 |  |
| ap-northeast-2 | 0.447 |  |
| ap-northeast-3 | 0.388 |  |
| ap-south-1 | 0.669 |  |
| ap-south-2 | 0.664 |  |
| ap-southeast-1 | 0.562 |  |
| ap-southeast-2 | 0.479 |  |
| ap-southeast-3 | 0.629 |  |
| ap-southeast-4 | 0.541 |  |
| ap-southeast-5 | 0.578 |  |
| ap-southeast-6 | 0.503 |  |
| ap-southeast-7 | 0.639 |  |
| ca-central-1 | 0.176 | 18 |
| ca-west-1 | 0.194 |  |
| eu-central-1 | 0.397 |  |
| eu-central-2 | 0.415 |  |
| eu-north-1 | 0.437 |  |
| eu-south-1 | 0.418 |  |
| eu-south-2 | 0.410 |  |
| eu-west-1 | 0.342 |  |
| eu-west-2 | 0.368 |  |
| eu-west-3 | 0.380 |  |
| il-central-1 | 0.514 |  |
| me-central-1 | 0.669 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.703 |  |
| mx-central-1 | 0.189 |  |
| sa-east-1 | 0.489 |  |
| us-east-1 | 0.151 | 5195 |
| us-east-2 | 0.139 | 1730 |
| us-gov-east-1 | 0.152 | 1966 |
| us-gov-west-1 | 0.121 | 249 |
| us-west-1 | 0.081 | 4223 |
| us-west-2 | 0.121 | 200 |

