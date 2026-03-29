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
Updated: 2026-03-29T04:32:01.504228+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.899 |  |
| ap-east-1 | 0.778 |  |
| ap-east-2 | 0.712 |  |
| ap-northeast-1 | 0.595 |  |
| ap-northeast-2 | 0.710 |  |
| ap-northeast-3 | 0.623 |  |
| ap-south-1 | 0.859 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.849 |  |
| ap-southeast-2 | 0.775 |  |
| ap-southeast-3 | 0.915 |  |
| ap-southeast-4 | 0.807 |  |
| ap-southeast-5 | 0.867 |  |
| ap-southeast-6 | 0.816 |  |
| ap-southeast-7 | 0.957 |  |
| ca-central-1 | 0.136 | 16 |
| ca-west-1 | 0.309 |  |
| eu-central-1 | 0.410 |  |
| eu-central-2 | 0.432 |  |
| eu-north-1 | 0.463 |  |
| eu-south-1 | 0.436 |  |
| eu-south-2 | 0.471 |  |
| eu-west-1 | 0.330 |  |
| eu-west-2 | 0.368 |  |
| eu-west-3 | 0.395 |  |
| il-central-1 | 0.577 |  |
| me-central-1 | 0.787 |  |
| me-south-1 | 0.743 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.520 |  |
| us-east-1 | 0.088 | 4386 |
| us-east-2 | 0.115 | 1461 |
| us-gov-east-1 | 0.107 | 1611 |
| us-gov-west-1 | 0.299 | 190 |
| us-west-1 | 0.230 | 3317 |
| us-west-2 | 0.276 | 152 |

