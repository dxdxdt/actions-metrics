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
Updated: 2026-03-23T17:45:20.373992+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.919 |  |
| ap-east-1 | 0.762 |  |
| ap-east-2 | 0.712 |  |
| ap-northeast-1 | 0.590 |  |
| ap-northeast-2 | 0.698 |  |
| ap-northeast-3 | 0.614 |  |
| ap-south-1 | 0.861 |  |
| ap-south-2 | 0.906 |  |
| ap-southeast-1 | 0.845 |  |
| ap-southeast-2 | 0.762 |  |
| ap-southeast-3 | 0.907 |  |
| ap-southeast-4 | 0.802 |  |
| ap-southeast-5 | 0.871 |  |
| ap-southeast-6 | 0.803 |  |
| ap-southeast-7 | 0.946 |  |
| ca-central-1 | 0.142 | 16 |
| ca-west-1 | 0.246 |  |
| eu-central-1 | 0.435 |  |
| eu-central-2 | 0.460 |  |
| eu-north-1 | 0.499 |  |
| eu-south-1 | 0.469 |  |
| eu-south-2 | 0.471 |  |
| eu-west-1 | 0.359 |  |
| eu-west-2 | 0.394 |  |
| eu-west-3 | 0.412 |  |
| il-central-1 | 0.599 |  |
| me-central-1 | 0.823 |  |
| me-south-1 | 0.770 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.549 |  |
| us-east-1 | 0.098 | 4340 |
| us-east-2 | 0.110 | 1449 |
| us-gov-east-1 | 0.112 | 1596 |
| us-gov-west-1 | 0.272 | 190 |
| us-west-1 | 0.231 | 3287 |
| us-west-2 | 0.282 | 151 |

