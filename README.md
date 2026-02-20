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
Updated: 2026-02-20T12:40:24.126333+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.891 |  |
| ap-east-1 | 0.804 |  |
| ap-east-2 | 0.735 |  |
| ap-northeast-1 | 0.617 |  |
| ap-northeast-2 | 0.724 |  |
| ap-northeast-3 | 0.647 |  |
| ap-south-1 | 0.870 |  |
| ap-south-2 | 0.955 |  |
| ap-southeast-1 | 0.865 |  |
| ap-southeast-2 | 0.782 |  |
| ap-southeast-3 | 0.921 |  |
| ap-southeast-4 | 0.820 |  |
| ap-southeast-5 | 0.890 |  |
| ap-southeast-6 | 0.859 |  |
| ap-southeast-7 | 0.972 |  |
| ca-central-1 | 0.104 | 16 |
| ca-west-1 | 0.267 |  |
| eu-central-1 | 0.396 |  |
| eu-central-2 | 0.410 |  |
| eu-north-1 | 0.442 |  |
| eu-south-1 | 0.425 |  |
| eu-south-2 | 0.432 |  |
| eu-west-1 | 0.317 |  |
| eu-west-2 | 0.354 |  |
| eu-west-3 | 0.380 |  |
| il-central-1 | 0.572 |  |
| me-central-1 | 0.783 |  |
| me-south-1 | 0.750 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.502 |  |
| us-east-1 | 0.060 | 4153 |
| us-east-2 | 0.085 | 1357 |
| us-gov-east-1 | 0.085 | 1493 |
| us-gov-west-1 | 0.292 | 159 |
| us-west-1 | 0.255 | 3085 |
| us-west-2 | 0.306 | 128 |

