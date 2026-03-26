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
Updated: 2026-03-26T22:21:23.874610+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.943 |  |
| ap-east-1 | 0.731 |  |
| ap-east-2 | 0.670 |  |
| ap-northeast-1 | 0.554 |  |
| ap-northeast-2 | 0.656 |  |
| ap-northeast-3 | 0.579 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.946 |  |
| ap-southeast-1 | 0.809 |  |
| ap-southeast-2 | 0.715 |  |
| ap-southeast-3 | 0.862 |  |
| ap-southeast-4 | 0.757 |  |
| ap-southeast-5 | 0.827 |  |
| ap-southeast-6 | 0.792 |  |
| ap-southeast-7 | 0.912 |  |
| ca-central-1 | 0.174 | 16 |
| ca-west-1 | 0.274 |  |
| eu-central-1 | 0.473 |  |
| eu-central-2 | 0.491 |  |
| eu-north-1 | 0.515 |  |
| eu-south-1 | 0.491 |  |
| eu-south-2 | 0.521 |  |
| eu-west-1 | 0.371 |  |
| eu-west-2 | 0.409 |  |
| eu-west-3 | 0.439 |  |
| il-central-1 | 0.647 |  |
| me-central-1 | 0.808 |  |
| me-south-1 | 0.798 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.583 |  |
| us-east-1 | 0.125 | 4366 |
| us-east-2 | 0.138 | 1457 |
| us-gov-east-1 | 0.124 | 1606 |
| us-gov-west-1 | 0.230 | 190 |
| us-west-1 | 0.178 | 3304 |
| us-west-2 | 0.229 | 151 |

