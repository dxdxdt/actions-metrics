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
Updated: 2025-04-08T08:17:40.649740+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.906 |  |
| ap-east-1 | 0.806 |  |
| ap-northeast-1 | 0.617 |  |
| ap-northeast-2 | 0.742 |  |
| ap-south-1 | 0.859 |  |
| ap-southeast-1 | 0.865 |  |
| ap-southeast-2 | 0.762 |  |
| ca-central-1 | 0.110 | 10 |
| eu-central-1 | 0.427 |  |
| eu-north-1 | 0.461 |  |
| eu-south-1 | 0.435 |  |
| eu-west-1 | 0.330 |  |
| eu-west-2 | 0.372 |  |
| eu-west-3 | 0.394 |  |
| me-south-1 | 0.766 |  |
| sa-east-1 | 0.510 |  |
| us-east-1 | 0.073 | 1513 |
| us-east-2 | 0.096 | 387 |
| us-gov-east-1 | 0.095 | 395 |
| us-gov-west-1 | 0.279 | 1 |
| us-west-1 | 0.251 | 1037 |
| us-west-2 | 0.280 |  |

