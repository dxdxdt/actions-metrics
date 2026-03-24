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
Updated: 2026-03-24T06:56:00.122612+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.941 |  |
| ap-east-1 | 0.756 |  |
| ap-east-2 | 0.706 |  |
| ap-northeast-1 | 0.579 |  |
| ap-northeast-2 | 0.686 |  |
| ap-northeast-3 | 0.604 |  |
| ap-south-1 | 0.895 |  |
| ap-south-2 | 0.942 |  |
| ap-southeast-1 | 0.837 |  |
| ap-southeast-2 | 0.754 |  |
| ap-southeast-3 | 0.890 |  |
| ap-southeast-4 | 0.797 |  |
| ap-southeast-5 | 0.850 |  |
| ap-southeast-6 | 0.849 |  |
| ap-southeast-7 | 0.944 |  |
| ca-central-1 | 0.129 | 16 |
| ca-west-1 | 0.245 |  |
| eu-central-1 | 0.448 |  |
| eu-central-2 | 0.459 |  |
| eu-north-1 | 0.502 |  |
| eu-south-1 | 0.469 |  |
| eu-south-2 | 0.478 |  |
| eu-west-1 | 0.373 |  |
| eu-west-2 | 0.399 |  |
| eu-west-3 | 0.425 |  |
| il-central-1 | 0.614 |  |
| me-central-1 | 0.821 |  |
| me-south-1 | 0.778 |  |
| mx-central-1 | 0.223 |  |
| sa-east-1 | 0.535 |  |
| us-east-1 | 0.090 | 4344 |
| us-east-2 | 0.087 | 1449 |
| us-gov-east-1 | 0.088 | 1600 |
| us-gov-west-1 | 0.269 | 190 |
| us-west-1 | 0.215 | 3289 |
| us-west-2 | 0.269 | 151 |

